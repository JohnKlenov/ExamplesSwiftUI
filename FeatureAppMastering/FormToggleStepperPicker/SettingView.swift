//
//  SettingView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 28.08.24.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showBookedOnly = false
    @State private var maxPriceLevel = 5
    
    var settingStore: SettingStore
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Picker(selection: $selectedOrder) {
                    
                    ForEach(DisplayOrderType.allCases, id: \.self) {
                        Text($0.text)
                    }
                } label: {
                    Text("Формат отображения")
                }
                
                Section {
                    Toggle(isOn: $showBookedOnly, label: {
                        Text("Показывать только забронированные")
                    })
                    
                    Stepper(value: $maxPriceLevel, in: 1...5) {
                        Text("Отобразить автомобили в ценновой категории")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        Text(String(repeating: "$", count: maxPriceLevel))
                            .font(.callout)
                            .foregroundStyle(.green)
                        Text("или ниже")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                } header: {
                    Text("Отфильтровать")
                }
                
                
            }
            .navigationTitle("Настройки")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Сохранить") {
                        settingStore.displayOrder = selectedOrder
                        settingStore.maxPriceLevel = maxPriceLevel
                        settingStore.showBookedOnly = showBookedOnly
                    }
                    .foregroundStyle(Color(uiColor: .label))
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Закрыть") {
                        dismiss()
                    }
                    .foregroundStyle(Color(uiColor: .label))
                }
            })
        }
        ///чтобы при загрузке этого экрана мы получали уже установленные настройки
        .onAppear(perform: {
            selectedOrder = settingStore.displayOrder
            showBookedOnly = settingStore.showBookedOnly
            maxPriceLevel = settingStore.maxPriceLevel
        })
        
    }
}

#Preview {
    SettingView(settingStore: SettingStore())
}





// MARK: - Trash

/// заменили на enum

//    private var displayOrders = [ "Алфитный порядок",
//                                  "Показывать сначала избранные",
//                                  "Показывать сначала забронированные"]

/// если displayOrders.count равно 5, то диапазон будет включать числа 0, 1, 2, 3 и 4.
//                    ForEach(0..<displayOrders.count, id: \.self) {
//                        Text(displayOrders[$0])
//                    }



