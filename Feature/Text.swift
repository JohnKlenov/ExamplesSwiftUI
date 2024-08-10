//
//  Text.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 25.07.24.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.black)
                .font(.system(size: 200))
    //            Text("SwiftUI - это фреймворк • с • набором готовых - библиотек для создания пользовательского интерфейса • в iOS-приложениях. Этот - инструмент, разработанный Арре, пришёл на смену UIKit - последний почти во - всём - устраивал - разработчиков, • но • создание элементов в части- UI - занимало много времени. SwiftUI не стоит путать со Swift - языком программирования, • с-помощью которого пишут приложения для платформы - Apple.)")
            Text("**Это жирный текст**, *Это курсив*, а еще можно делать ссылки [кликните тут](https://t.me/swiftexplorer)")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.purple)
                .lineLimit(nil)
                .multilineTextAlignment(.trailing)

    //                .truncationMode(.middle)
    //                .lineSpacing(5)
                .padding()
        }
        .padding()

    }

}

struct Text_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
