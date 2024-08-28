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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cars) { car in
                    BasicImageRow(car: car)
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
                }
                ///передает набор индексов(indexSet) в замыкание, которое относится к базовой коллекции данных динамического представления.
                ///Своего рода indexPath
                .onDelete(perform: { indexSet in
                    self.cars.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Аренда Авто")
        }
    }
    
    private func delete(item car:Car) {
        if let index = self.cars.firstIndex(where: { $0.id == car.id}) {
            self.cars.remove(at: index)
            print("fff")
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
}



#Preview {
    ListBasicView()
}
