//
//  HomeView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 22.07.24.
//

import SwiftUI

struct HomeView: View {
    
    var model = ItemStore()
    var body: some View {
        NavigationView {
            List {
                Section("Language") {
                    ForEach(model.language) { pet in
                        
                        RowView(pet: pet).swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button(action: {
                                print("DidTapButton")
                            }) {
                                Image(systemName: "swift")
                            }.tint(.orange)
                        }
                    }
                }
                
                Section("Weather") {
                    ForEach(model.weather) { pet in
                        RowView(pet: pet)
                    }
                }
            }

            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {

                    Button("Edit") {
                        // Действие при нажатии на кнопку
                    }
                    .foregroundColor(.purple)
                    .font(.headline)
                    .padding()
                }
            }
        }
    }
}



struct RowView: View {
    
    var pet:Model
    
    var body: some View {
        HStack {
            profileImage
            VStack(alignment: .leading) {
                Text(pet.name)
                Text(pet.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    private var profileImage: some View {
        Image("Icon").resizable().cornerRadius(40).frame(width: 60, height: 60, alignment: .center).shadow(radius: 3).overlay {
            Circle().stroke(.green, lineWidth: 2)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}





// MARK: - Trash

//                    Button {
//                        print("")
//                    } label: {
//                        Image(systemName: "camera")
//                            .foregroundColor(.gray)
//                            .padding()
//                            .font(.headline)
//                    }
