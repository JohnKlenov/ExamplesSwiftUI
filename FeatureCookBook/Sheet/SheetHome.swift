//
//  SheetHome.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 25.08.24.
//

import SwiftUI

struct SheetHome: View {
    
    @State private var isSheetPresented = false
    @State private var isSheetWithNavPresented = false
    @State private var isFullScreenCoverPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            
            // MARK: Modal Present
            Button("Show sheet whith drag") {
                isSheetPresented = true
            }
            .buttonStyle(.bordered)
            .tint(.purple)
            .sheet(isPresented: $isSheetPresented, content: {
                SheetView()
                /// добавляет индикатор для смахивания
                    .presentationDragIndicator(.visible)
            })
            
            
            // MARK: NavModalPresent
            Button("Show sheet with navigation bar") {
                isSheetWithNavPresented = true
            }
            .buttonStyle(.bordered)
            .tint(.red)
            .sheet(isPresented: $isSheetWithNavPresented) {
                ///можем использовать необязательное закрытие onDismiss для запуска действия при закрытии листа.
                print("Sheet dismissed")
            } content: {
                SheetWithNavBar(text: "Sheet with navigation bar and presentation detents")
                ///Набор поддерживаемых фиксаторов для листа. Если вы предоставите более одного фиксатора, пользователи смогут перетаскивать лист, чтобы изменить его размер.
                ///Индикатор перетаскивания автоматически отображается, когда лист использует более одного фиксатора.
                ///[.height(10)] - можем определить высоту вылета
                    .presentationDetents([.medium, .large])
                ///Управляет тем, могут ли люди взаимодействовать с видом за презентацией.
                    .presentationBackgroundInteraction(.enabled)
            }
            
            
            // MARK: FullPresent
            Button("Show full screen cover") {
                isFullScreenCoverPresented = true
            }.fullScreenCover(isPresented: $isFullScreenCoverPresented) {
                SheetWithNavBar(text: "Full screen cover with navigation bar")
            }
        }
    }
}

#Preview {
    SheetHome()
}


