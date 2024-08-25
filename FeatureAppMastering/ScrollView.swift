//
//  ScrollView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 29.07.24.
//

import SwiftUI

struct Scroll: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStackCardView()
            
        }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        Scroll()
    }
}


struct CardView: View {
    
    var imageName: String
    var productType: String
    var productName: String
    var creatorName: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(productType)
                .font(.headline)
                .foregroundStyle(.gray)
            Text(productName)
                .font(.title)
            Text("Created by \(creatorName)")
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.bottom)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct HStackCardView: View {
    var body: some View {
        HStack {
            Group {
                CardView(imageName: "1",
                         productType: "MacBook D",
                         productName: "Doubled MacBook Concep",
                         creatorName: "Oliver Thompson")
                CardView(imageName: "2",
                         productType: "MacBook S",
                         productName: "MacBook S Concept",
                         creatorName: "Emily Bennett")
                CardView(imageName: "3",
                         productType: "MacBook Steam",
                         productName: "SteamPunk MacBook Concept",
                         creatorName: "Haruto Tanaka")
                CardView(imageName: "4",
                         productType: "MacBook S",
                         productName: "Full Sensored MacBook Concept",
                         creatorName: "Yui Sato")
            }
            .padding()
            .frame(width: 400)
        }
    }
}

//        ScrollView ([.horizontal, .vertical]) {
//            Image("los-angeles")
//        }
