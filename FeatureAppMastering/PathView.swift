//
//  PathView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 31.07.24.
//

import SwiftUI


struct PathView: View {
    
    var body: some View {
        VStack {
            DonutChart()
        }
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}





struct DonutChart: View {
    var body: some View {
        
        ZStack {
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color(.systemBlue), lineWidth: 80)
            Circle()
                .trim(from: 0.2, to: 0.43)
                .stroke(Color(.systemTeal), lineWidth: 80)
            Circle()
                .trim(from: 0.43, to: 0.70)
                .stroke(Color(.systemPurple), lineWidth: 80)
            Circle()
                .trim(from: 0.70, to: 1)
                .stroke(Color(.systemGreen), lineWidth: 90)
                .overlay(
                    Text("30%")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 80, y: -100)
                )
        }
        .frame(width: 250, height: 250)
    }
}

struct IndicatorProgress: View {
    
    private var purpleGradient = LinearGradient(
        gradient: Gradient(
            colors: [ Color (red: 207/255, green: 150/255, blue: 207/255),
                      Color(red: 107/255, green: 116/255,
                            blue: 179/255) ]),
        startPoint: .trailing, endPoint: .leading)

    var body: some View {
        
        ZStack {
            
            Circle().stroke(Color(UIColor.secondarySystemFill), lineWidth: 20)
                .frame(width: 300, height: 300)
            Circle()
                .trim(from: 0, to: 0.91)
                .stroke(purpleGradient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay {
                    VStack {
                        Text("91%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
        }
    }
}


struct DomeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint( x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path }
}


struct ArcView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.addArc(center: CGPoint(x: 160, y: 200), radius: 140, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)
            path.closeSubpath()
        }
        .stroke(Color.green, lineWidth: 2)
        //                .fill(Color.green)
    }
}

struct QuadCurve: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 90))
            path.addLine(to: CGPoint(x: 40, y: 60))
            path.closeSubpath()
        }
        .stroke(Color.green, lineWidth: 2)
    }
}

struct Curve: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 200))
            path.addCurve(to: CGPoint(x: 120, y: 100),
                          control1: CGPoint(x: 70, y: 250), control2: CGPoint(x: 100, y: 50))
            path.addCurve(to: CGPoint(x: 220, y: 200),
                          control1: CGPoint(x: 140, y: 150), control2: CGPoint(x: 180, y: 250))
            path.addCurve(to: CGPoint(x: 320, y: 100),
                          control1: CGPoint(x: 260, y: 150), control2: CGPoint(x: 290, y: 50))
        }
        .stroke(Color.green, lineWidth: 2)
    }
}

struct             ZStackAndManyPath: View {
    var body: some View {
        ZStack {
            // Draw the filled shape
            Path { path in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 200, y: 20))
                path.addQuadCurve(to: CGPoint(x: 110, y: 100), control: CGPoint(x: 200, y: 90))
                path.addLine(to: CGPoint(x: 20, y: 20))
            }
            .fill(Color.purple)
            
            // Draw the border of the shape
            Path { path in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 200, y: 20))
                path.addQuadCurve(to: CGPoint(x: 110, y: 100), control: CGPoint(x: 200, y: 90))
                path.addLine(to: CGPoint(x: 20, y: 20))
            }
            .stroke(Color.black, lineWidth: 4)
        }
    }
}


struct PieChart: View {
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let center = CGPoint(x: size / 2, y: size / 2)
            let radius = size / 2

            ZStack {
                Path { path in
                    path.move(to: center)
                    path.addArc(center: center,
                                radius: radius, startAngle: .degrees(0),
                                endAngle: .degrees(190), clockwise: true)
                }
                .fill(Color.yellow)

                Path { path in
                    path.move(to: center)
                    path.addArc(center: center,
                                radius: radius, startAngle: .degrees(190),
                                endAngle: .degrees(110), clockwise: true)
                }
                .fill(Color.teal)

                Path { path in
                    path.move(to: center)
                    path.addArc(center: center,
                                radius: radius, startAngle: .degrees(110),
                                endAngle: .degrees(90), clockwise: true)
                }
                .fill(Color.blue)

                Path { path in
                    path.move(to: center)
                    path.addArc(center: center, radius: radius, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
                }
                .fill(Color.purple)
                .offset(x: 20, y: 20)

                Path { path in
                    path.move(to: center)
                    path.addArc(center: center, radius: radius, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
                    path.closeSubpath()
                }
                .stroke(Color(red: 52/255, green: 52/255, blue: 122/255), lineWidth: 10)
                .offset(x: 20, y: 20)
                .overlay(
                    Text("25%")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 20 + radius/2, y: radius/2)
                )
            }
            .frame(width: size, height: size)
        }
    }
}


struct RectView: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 100, y: 100))
            path.addQuadCurve(to: CGPoint(x: 300, y: 100), control: CGPoint(x: 200, y: 80))
            path.addRect(CGRect(x: 100, y: 100, width: 200, height: 40))
        }
        .fill(Color.green)
    }
}

struct ShapeView: View {
    var body: some View {
        Button {
            print("did tap button")
        } label: {
            Text("Button")
                .font(.system(.title, design: .rounded))
                .foregroundColor(.white)
                .bold()
                .frame(width: 200, height: 100)
                .background(DomeShape().fill(.green))
        }
    }
}

struct BuiltInShapes: View {
    var body: some View {
        Circle()
            .foregroundColor(.green)
            .frame(width: 200, height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
            )
    }
}
