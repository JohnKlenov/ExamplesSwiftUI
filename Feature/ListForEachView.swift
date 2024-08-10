//
//  ListForEachView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 7.08.24.
//

import SwiftUI

struct ListForEachView: View {
    
    var rockGroups = RockGroupData.data
    
    var body: some View {
        
        NavigationView {
            List(rockGroups) { group in
                NavigationLink(destination: RockGroupView(rockGroup: group)) {
                    RockCell(group: group)
                }
                .listRowSeparatorTint(.black)
                .listRowBackground(Color.red)
                .listRowInsets(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle("Rock groups")
        }
    }
    
    // custom navigationBar
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont(name: "AmericanTypewriter-CondensedBold", size: 35) ?? UIFont()]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.red, .font: UIFont(name: "AmericanTypewriter-CondensedBold", size: 20) ?? UIFont()]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}

struct ListForEachView_Previews: PreviewProvider {
    static var previews: some View {
        ListForEachView()
    }
}

struct RockCell: View {
    
    var group: RockGroup
    
    var body: some View {
        HStack {
            Image(group.groupImageName)
                .resizable()
                .frame(width: 180, height: 180)
            Text(group.groupName)
                .font(.system(.title3))
                .bold()
        }
    }
}


// MARK: - Model

struct RockGroup:Identifiable {
    var id = UUID()
    var groupName: String
    var groupImageName: String
}

struct RockGroupData {
    static let data = [
    RockGroup(groupName: "The Beatles", groupImageName: "The Beatles"),
    RockGroup(groupName: "Rolling Stones", groupImageName: "Rolling Stones"),
    RockGroup(groupName: "Prince & The Revolution", groupImageName: "Prince & The Revolution"),
    RockGroup(groupName: "Queen", groupImageName: "Queen"),
    RockGroup(groupName: "Guns N' Roses", groupImageName: "Guns N' Roses"),
    RockGroup(groupName: "AC/DC", groupImageName: "AC:DC"),
    RockGroup(groupName: "The Jimi Hendrix", groupImageName: "The Jimi Hendrix"),
    RockGroup(groupName: "Led Zeppelin", groupImageName: "Led Zeppelin"),
    RockGroup(groupName: "Bob Dylan", groupImageName: "Bob Dylan"),
    RockGroup(groupName: "Joan Jett and the Blackhearts", groupImageName: "Joan Jett and the Blackhearts"),
    RockGroup(groupName: "Pink Floyd", groupImageName: "Pink Floyd"),
    RockGroup(groupName: "Grateful Dead", groupImageName: "Grateful Dead"),
    RockGroup(groupName: "The Traveling Wilburys", groupImageName: "The Traveling Wilburys"),
    RockGroup(groupName: "Bruce Springsteen and The E Street Band", groupImageName: "Bruce Springsteen and The E Street Band"),
    RockGroup(groupName: "Little Richard and The Upsetters", groupImageName: "Little Richard and The Upsetters"),
    RockGroup(groupName: "The Kinks", groupImageName: "The Kinks"),
    RockGroup(groupName: "Creedence Clearwater Revival", groupImageName: "Creedence Clearwater Revival"),
    RockGroup(groupName: "The Band", groupImageName: "The Band"),
    RockGroup(groupName: "The Cure", groupImageName: "The Cure"),
    RockGroup(groupName: "Allman Brothers Band", groupImageName: "Allman Brothers Band")
    ]
}



// MARK: - Code snippet

//    var rockGroups = ["The Beatles", "Rolling Stones", "Prince & The Revolution", "Queen", "Guns N' Roses", "AC:DC", "The Jimi Hendrix", "Led Zeppelin", "Bob Dylan", "Joan Jett and the Blackhearts", "Pink Floyd", "Grateful Dead", "The Traveling Wilburys", "Bruce Springsteen and The E Street Band", "Little Richard and The Upsetters", "The Kinks", "Creedence Clearwater Revival", "The Band", "The Cure", "Allman Brothers Band"]
    

//        List(1...4, id: \.self) {
//            Text("Список \($0)")
//        }


//                .listRowSeparator(.hidden)
//            .ignoresSafeArea()
