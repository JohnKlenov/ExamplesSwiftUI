//
//  StackView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 26.07.24.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        VStack {
            HStack {
                HeaderView()
                Spacer()
            }
            VStack(spacing: 20) {
                HStack {
                    DeviceView(device: "Apple Watch", price: "500$", textColor: .white, bgColor: .gray)
                    ZStack {
                        DeviceView(device: "Iphone", price: "999$", textColor: .orange, bgColor: .green)
                        SmallLabelView()
                    }
                }
                .padding(.horizontal)
                ZStack {
                    DeviceView(device: "MacBook", price: "1499$", textColor: .white, bgColor: .black, infoIcon: Image(systemName: "info.circle.fill"))
                    Image(systemName: "swift")
                        .font(.title)
                        .foregroundStyle(.white)
                        .offset(x: 0, y: -70)
                }
                .padding(.horizontal)
            }
            Spacer()
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}


struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2, content: {
            Text("Выберите")
                .fontWeight(.black)
                .font(.system(.largeTitle, design: .rounded))
                .padding(.leading)
            Text("Ваш девайс")
                .fontWeight(.black)
                .font(.system(.largeTitle, design: .rounded))
                .padding(.leading)
        })
    }
}


struct DeviceView: View {
    // Добавляем новые свойства нашей структуре
    var device: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var infoIcon: Image?

        var body: some View {
            VStack {
                // Название девайса
                Text(device)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                // Цвет текста
                    .foregroundColor(textColor)
                    .minimumScaleFactor(0.5)
                // Цена девайса
                Text(price)
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                // Цвет текста
                    .foregroundColor(textColor)
                    .minimumScaleFactor(0.5)
                Text("Series X")
                    .font(.headline)
                // Цвет текста
                    .foregroundColor(textColor)
                if infoIcon != nil {
                    HStack{
                        Spacer()
                        infoIcon
                        .foregroundStyle(.white)
                        .offset(x: 30, y: 40)
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 140)
            .padding(40)
            // Цвет фона
            .background(bgColor)
            .cornerRadius(10)
        }
}


struct SmallLabelView: View {
    var body: some View {
        Text("Лучшее для фотографов")
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(.orange)
            .offset(x: 0, y: 110)
    }
}



// MARK: - Trash

//
//HStack {
//    RoundedRectangle(cornerRadius: 20)
//        .foregroundStyle(LinearGradient(colors: [.teal, .indigo], startPoint: .top, endPoint: .leading))
//        .overlay {
//            Text("1")
//                .font(.system(size: 50))
//
//        }
//    RoundedRectangle(cornerRadius: 20)
//        .foregroundStyle(LinearGradient(colors: [.teal, .indigo], startPoint: .top, endPoint: .leading))
//        .overlay {
//            Text("2")
//                .font(.system(size: 50))
//
//        }
//    RoundedRectangle(cornerRadius: 20)
//        .foregroundStyle(LinearGradient(colors: [.teal, .indigo], startPoint: .top, endPoint: .leading))
//        .overlay {
//            Text("3")
//                .font(.system(size: 50))
//
//        }
//}
