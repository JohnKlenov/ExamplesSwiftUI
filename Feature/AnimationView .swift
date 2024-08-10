//
//  AnimationView .swift
//  SwiftUIProject
//
//  Created by Evgenyi on 2.08.24.
//

import SwiftUI

struct AnimationView_: View {
    
    var body: some View {
        VStack {
            ConvertButton()
        }
    }
}

struct AnimationView__Previews: PreviewProvider {
    static var previews: some View {
        AnimationView_()
    }
}


struct ConvertButton: View {
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundColor(recordBegin ? .red : .green)
                .overlay(
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundColor(.white)
                        .scaleEffect(recording ? 0.7 : 1)
                )
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundColor(.green)
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                recordBegin.toggle()
            }
            withAnimation(Animation.spring().repeatForever().delay(0.5)) { recording.toggle()
            }
        }
    }
}
struct BubbleIndicatorLoader: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(0...4, id: \.self) { index in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.green)
                        .scaleEffect(isLoading ? 0 : 1)
                        .animation(.easeInOut.delay(3), value: isLoading)
                        .animation(.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)),
                                                           value: isLoading)
                }
            }
            .onAppear {
                isLoading = true
            }
        }
    }
}

struct RoundIndicatorProgress: View {
    @State private var progress: CGFloat = 0.0
    
    var body: some View {

        ZStack {
            
            Text("\(Int(progress*100))%")
                .font(.system(.title, design: .rounded))
                .bold()
            Circle()
                .stroke(.gray, lineWidth: 10)
                .frame(width: 150, height: 150)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.green, lineWidth: 10)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                progress += 0.01
                if progress >= 1 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct LinerIndicatorLoader: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
            RoundedRectangle(cornerRadius: 3)
                .stroke(.gray, lineWidth: 3)
                .frame(width: 250, height: 3)
            RoundedRectangle(cornerRadius: 3)
                .stroke(.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
        }
        .onAppear {
            isLoading = true
        }
    }
}

struct RoundIndicatorLoader: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray, lineWidth: 14)
                .frame(width: 100, height: 100)
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(.green, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0)).animation(.linear(duration: 5).repeatForever(autoreverses: false), value: isLoading)
            ///Добавляет действие, которое нужно выполнить при появлении этого представления.
                .onAppear {
                    print(" Circle.onAppear")
                    isLoading = true
                }
        }
    }
}

struct ExplicitImplicitAnimView: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? .gray : .red)
            /// implicit не явная анимация
            //                .animation(.default, value: circleColorChanged)
            Image(systemName: "heart.fill")
                .font(.system(size: 100, weight: .bold, design: .default))
                .foregroundColor(heartColorChanged ? .red : .white)
                .scaleEffect(heartSizeChanged ? 1 : 0.5)
        }
        .onTapGesture {
            /// explicit явная анимация
            withAnimation(.default) {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
//                            self.circleColorChanged.toggle()
//                            self.heartColorChanged.toggle()
//                        }
//                        self.heartSizeChanged.toggle()
        }
    }
}
