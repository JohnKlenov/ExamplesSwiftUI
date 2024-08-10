//
//  TransitionView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 6.08.24.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var show = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay {
                    Text("Show detail info")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay {
                        Text("Detail info")
                            .font(.system(.largeTitle, design: .rounded))
                            .foregroundColor(.black)
                            .bold()
                    }
                    .transition(.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0)))
                // .transition(.offsetScaleOpacity)
                
                // .transition(.scale(scale: 0, anchor: .bottom))
                // .transition(.offset(x: -600, y: 0).combined(with: .scale))
                // .transition(.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
                
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}


struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}


extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x: -600, y: 00)
        )
    }
}
