//
//  SheetWithNavBar.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 25.08.24.
//

import SwiftUI

struct SheetWithNavBar: View {
    
    @Environment(\.dismiss) private var dismiss
    var text = "Sheet with navigation bar"
    var body: some View {
        NavigationStack {
            ZStack{
                Color(uiColor: UIColor(white: 0.9, alpha: 1))
                    .ignoresSafeArea()
                Text(text)
            }
            .navigationTitle("Sheet title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button("Dismiss") {
                    dismiss()
                }
                .buttonStyle(.bordered)
//                .tint(.black)
            })
            .toolbarBackground(.gray, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .tint(.white)
    }
}

#Preview {
    SheetWithNavBar()
}
