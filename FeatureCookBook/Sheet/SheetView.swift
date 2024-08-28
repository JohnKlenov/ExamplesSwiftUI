//
//  SheetView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 25.08.24.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
        ZStack() {
            Color.blue.ignoresSafeArea()
            Text("This is the sheet we want to display")
        }
    }
}

#Preview {
    SheetView()
}
