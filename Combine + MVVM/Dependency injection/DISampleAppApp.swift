//
//  RootViewDI.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 6.10.24.
//

import SwiftUI

struct DISampleAppApp: App {

    //    let networkManager = NetworkManagerDI(urlProvider: RealURLProvider())
    var body: some Scene {
        WindowGroup {
            RootContetnView(urlProvider: RealURLProvider())
//            RootContetnView()
//                .environmentObject(networkManager)
            
        }
    }
}


