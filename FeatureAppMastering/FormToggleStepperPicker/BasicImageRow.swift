//
//  BasicImageRow.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 27.08.24.
//

import SwiftUI

struct BasicImageRow: View {
    
    var car:Car
    
    var body: some View {
        HStack {
            Image(car.image)
                .resizable()
                .frame(width: 60, height: 60)
            ///модификатор, который обрезает изображение в форме круга.
                .clipShape(Circle())
            ///модификатор, который добавляет отступ справа от изображения.
                .padding(.trailing, 10)
            VStack(alignment: .leading, content: {
                HStack {
                    Text(car.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    Text(String(repeating: "$", count: car.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(car.type.rawValue)
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                Text(car.vin)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.secondary)
            })
            
            Spacer()
            /// приоритет для layout view
                .layoutPriority(-100)
            
            if car.isBooked {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            if car.isFavorite {
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
//
//#Preview {
//    BasicImageRow(car: FakeData.cars.first!)
//}
