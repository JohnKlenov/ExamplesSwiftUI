//
//  SettingView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 28.08.24.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    private var displayOrders = [ "Алфитный порядок",
                                  "Показывать сначала избранные",
                                  "Показывать сначала забронированные"]
    
    @State private var selectedOrder = 0
    @State private var showBookedOnly = false
    @State private var maxPriceLevel = 5
    
    var body: some View {

        NavigationStack {
            Form {
                
                Picker(selection: $selectedOrder) {
                    /// если displayOrders.count равно 5, то диапазон будет включать числа 0, 1, 2, 3 и 4.
                    ForEach(0..<displayOrders.count, id: \.self) {
                        Text(displayOrders[$0])
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
                        print("did tap Save")
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
        
    }
}

#Preview {
    SettingView()
}
