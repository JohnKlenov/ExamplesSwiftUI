//
//  RangeView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 22.07.24.
//

import SwiftUI

struct RatingContainerView:View {

    @State private var rating: Double = 2.0

    var body: some View {

        VStack(alignment: .center, spacing: 0, content: {
            Text("Range")
            LinearGaugeView(value: rating, range: 1...10)
            RatingView(rating: $rating)
            Spacer()
        })


    }
}

struct LinearGaugeView: View {
    let value: Double
    let range: ClosedRange<Double>

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)

                Rectangle()
                    .frame(width: CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * geometry.size.width, height: 10)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct RatingView: View {

    @Binding var rating: Double


    var body: some View {

        HStack(alignment: .center) {
            Button(action: {
                rating -= 1
            }) {
                Image(systemName: "minus.circle")
            }
            .disabled(rating == 0)
            Text("\(rating)")
            Button(action: {
                rating += 1
            }) {
                Image(systemName: "plus.circle")
            }.disabled(rating == 10)
        }
    }
}
struct RangeView_Previews: PreviewProvider {
    static var previews: some View {
        RatingContainerView()
    }
}
