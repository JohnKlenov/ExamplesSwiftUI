//
//  RockParalax.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 12.08.24.
//

import SwiftUI

struct RockParalax: View {
    @Environment(\.dismiss) var dismiss
    var imageName: String
    var body: some View {
        ScrollView {
            /// erазав pinnedViews:  [.sectionHeaders] и используя заголовок в Section(header: )  он будет прилипать при прокрутке
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                ////Это контейнерное представление, которое позволяет получить информацию о геометрии родительского представления.
                GeometryReader { reader -> AnyView in
                    ///вычисляет вертикальное смещение (offset) текущего представления (view) относительно глобальных координат экрана.
                    ///.frame(in: .global) возвращает прямоугольник (CGRect) текущего представления в глобальных координатах экрана.
                    ///Значение minY отражает вертикальное смещение текущего представления относительно верхней границы экрана.
                    let offset = reader.frame(in: .global).minY
                    print("offset - \(offset)")
                    return AnyView(
                        ///Изображение масштабируется и обрезается с учетом размеров экрана.
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                            .cornerRadius(2)
                        ///.offset(x: 0, y: 110) смещает представление (view) на экране.
                            .offset(y: (offset > 0 ? -offset : 0))
                            .overlay(
                                HStack {
                                    Button(action: { dismiss() }, label: {
                                        Image(systemName: "arrow.left")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.red)
                                    })
                                    
                                    Spacer()
                                    
                                    Button(action: {}, label: {
                                        Image(systemName: "suit.heart.fill")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.red)
                                    })
                                }
                                    .padding(), alignment: .top
                            )
                    )
                }
                .frame(height: 250)
                Section(header: Text("Heder Section")) {
                    ForEach(1..<70) { index in
                        Text("\(index)")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
            }
            )
        }
        .navigationBarHidden(true)
    }
}


struct RockParalax_Previews: PreviewProvider {
    static var previews: some View {
        RockParalax(imageName: "The Jimi Hendrix")
    }
}
