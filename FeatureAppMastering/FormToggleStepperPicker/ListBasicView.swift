//
//  ListBasicView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 27.08.24.
//

import SwiftUI

struct ListBasicView: View {
    
    @State var cars = FakeData.cars
    @State private var selectedCar: Car?
    
    @State private var showSettings: Bool = false
    
    /// что бы в симуляторе жэто работало мы должны передать сюда данные и rootView
    @EnvironmentObject var settingStore: SettingStore
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cars.sorted(by: settingStore.displayOrder.predicate())) { car in
                    if shouldShowItem(car: car) {
                        BasicImageRow(car: car)
                        ///модификатор, который отображает контекстное меню при долгом нажатии на элемент списка.
                            .contextMenu(ContextMenu(menuItems: {
                                
                                Button {
                                    self.book(item: car)
                                } label: {
                                    Label("Забронировать", systemImage: "checkmark.seal.fill")
                                }
                                
                                Button {
                                    self.delete(item: car)
                                } label: {
                                    HStack{
                                        Text("Удалить")
                                        Image(systemName: "trash")
                                    }
                                }
                                
                                Button(action: {
                                    self.setFavorite(item: car)
                                }, label: {
                                    HStack{
                                        Text("Любимый")
                                        Image(systemName: "star")
                                    }
                                })
                                
                                
                            }))
                            .onTapGesture {
                                self.selectedCar = car
                            }
                    }
                }
                ///передает набор индексов(indexSet) в замыкание, которое относится к базовой коллекции данных динамического представления.
                ///Своего рода indexPath
                .onDelete(perform: { indexSet in
                    self.cars.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Аренда Авто")
            ///Модификатор toolbar позволяет добавить кнопку на панель навигации.
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action:  {
                        showSettings = true
                    }, label: {
                        Image(systemName: "gear")
                            .font(.title2)
                        /// system color
                            .foregroundStyle(Color(uiColor: .label))
                    })
                }
            }
            .sheet(isPresented: $showSettings, content: {
                SettingView().environmentObject(self.settingStore)
                    .presentationDragIndicator(.visible)
            })
        }
    }
    
    private func delete(item car:Car) {
        if let index = self.cars.firstIndex(where: { $0.id == car.id}) {
            self.cars.remove(at: index)
        }
    }
    
    private func setFavorite(item car:Car) {
        if let index = self.cars.firstIndex(where: { $0.id == car.id}) {
            self.cars[index].isFavorite.toggle()
        }
    }
    
    private func book(item car: Car) {
        if let index = self.cars.firstIndex(where: { $0.id == car.id }) {
            self.cars[index].isBooked.toggle()
        }
    }
    
    /// && для true нужно 2 true
    /// || для true нужно 1 true
    /// В приведенном выше коде мы проверяем, выбрана ли опция «showBookedOnly», и проверяем уровень цен данной машины.
    /// если showBookedOnly не выбрана то отобразяться все машину у которых car.priceLevel self.settingStore.maxPriceLevel
    private func shouldShowItem(car:Car) -> Bool {
        return (!self.settingStore.showBookedOnly || car.isBooked) && (car.priceLevel <= self.settingStore.maxPriceLevel)
    }
}


#Preview {
    ListBasicView().environmentObject(SettingStore())
}
