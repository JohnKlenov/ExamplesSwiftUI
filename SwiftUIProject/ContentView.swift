//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 21.07.24.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 0
    let settingStore = SettingStore()
    var body: some View {
        
        TabView(selection:$selection) {
            
            HomeView()
                .tabItem {
                    Label("Home",
                          systemImage: "house.fill")
                }.tag(0)
            
            GalleryView()
                .tabItem {
                    Label("Gallery",
                          systemImage: "photo.on.rectangle.fill")
                }.tag(1)
            LazyView {
                CardListView()
            }
            .tabItem { Label("List",
                             systemImage: "person.crop.circle.fill")
            }.tag(2)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

///в TabBarViewController инициализация вкладок происходит по умолчанию при их выборе.
///LazyView - это удобный и простой способ. Он позволяет отложить инициализацию до момента, когда представление действительно потребуется, что может улучшить производительность приложения.
struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}



// MARK: - Table

//            ProfileView()
//                .tabItem {
//                    Label("Profile",
//                          systemImage: "person.crop.circle.fill")
//                }.tag(2)
//            ListBasicView().environmentObject(settingStore)
//                .tabItem {
//                    Label("List",
//                          systemImage: "person.crop.circle.fill")
//                }.tag(2)
