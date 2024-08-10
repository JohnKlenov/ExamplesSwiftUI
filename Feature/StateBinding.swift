//
//  StateBinding.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 30.07.24.
//

import SwiftUI


struct StateBinding: View {
    
    @State var isLaked:Bool = false
    @State var isScaled:Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ZStack(alignment: .topTrailing) {
                Image("MinskCity")
                    .resizable()
                    .scaledToFit()
                
                LikeButton(isLaked: $isLaked, isScaled: $isScaled)

            }
            VStack(alignment: .leading, spacing: 0) {
                Text("MINSK CITY MALL")
                        .font(.headline)
                        .foregroundColor(.primary)
                Text("street Lenina 2")
            }
            .padding()
        }
    }
}

struct StateBinding_Previews: PreviewProvider {
    static var previews: some View {
        StateBinding()
    }
}


struct LikeButton: View {
    
    @Binding var isLaked:Bool
    @Binding var isScaled:Bool
    
    var body: some View {
        
        Button {
            withAnimation( .easeInOut(duration: 0.3)) {
                isLaked.toggle()
            }
            withAnimation(.easeInOut(duration: 0.5).repeatCount(0)) {
                isScaled.toggle()
            }
        } label: {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundColor(isLaked ? .red : .gray)
                .scaleEffect(isScaled ? 1.2 : 1)
                .padding()
        }
    }
}



