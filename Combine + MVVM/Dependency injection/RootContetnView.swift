//
//  RootContetnView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 6.10.24.
//

import SwiftUI
 extension RootContetnView {
    init(urlProvider: URLProvider) {
        ///Подчеркивание (_) перед networkManager — это соглашение в SwiftUI для доступа к внутреннему хранилищу обертки свойства. Это необходимо, когда нужно инициализировать StateObject с пользовательским значением.
        ///правильно инициализируется с зависимостями и управляется SwiftUI.
        _networkManager = StateObject(wrappedValue: NetworkManagerDI(urlProvider: urlProvider))
    }
 }

struct RootContetnView: View {
    
    @StateObject var networkManager: NetworkManagerDI
//    @EnvironmentObject var networkManager: NetworkManagerDI

    var body: some View {
        VStack {
            Button("Fetch Data") {
                networkManager.fetchData()
            }
        }
        .padding()
    }
}

// #Preview {
//    RootContetnView()
// }



