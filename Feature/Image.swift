//
//  Image.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 25.07.24.
//

import SwiftUI

struct ImageView: View {
    var body: some View {

        ZStack {
            Circle()
                .foregroundColor(.red)
            VStack {
                Image("los-angeles")
                    .resizable()
                    .frame(width: 350)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .opacity(0.6)
                            .overlay {
                                Text("Night City")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                    }
            }
        }
        .padding()
    }

}

// custom Shape
struct Star: Shape {
 let corners: Int
 let innerRatio: CGFloat
 
 init(corners: Int = 5, innerRatio: CGFloat = 0.5) {
  self.corners = corners
  self.innerRatio = innerRatio
 }
 
 func path(in rect: CGRect) -> Path {
  guard corners >= 2 else { return Path() }
  
  let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
  let outerRadius = min(rect.width, rect.height) / 2
  let innerRadius = outerRadius * innerRatio
  
  var path = Path()
  
  for i in 0..<corners * 2 {
   let angle = CGFloat.pi * CGFloat(i) / CGFloat(corners)
   let radius = (i % 2 == 0) ? outerRadius : innerRadius
   
   let x = center.x + radius * cos(angle)
   let y = center.y + radius * sin(angle)
   
   if i == 0 {
    path.move(to: CGPoint(x: x, y: y))
   } else {
    path.addLine(to: CGPoint(x: x, y: y))
   }
  }
  
  path.closeSubpath()
  
  return path
 }
}
struct Image_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}


//        VStack {
//         Image(systemName: "thermometer.sun.fill")
//          .font(.system(size: 80))
//          .symbolRenderingMode(.palette)
//          .foregroundStyle(.red, .yellow, .black)
//        }

//                        Image(systemName: "heart.fill")
//                            .foregroundColor(.red)
//                            .font(.system(size: 50))
