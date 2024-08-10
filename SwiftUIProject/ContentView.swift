//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 21.07.24.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 0
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

            ProfileView()
                .tabItem {
                    Label("Profile",
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





// MARK: - Table

