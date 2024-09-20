//
//  ViewPassthrough.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 16.09.24.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city = ""
    var body: some View {
        VStack {
            TextField("Enter city", text: $city, onCommit: {
                viewModel.citySubject.send(city)
            })
            .textFieldStyle(.roundedBorder)
            .padding()
            if let wether = viewModel.weather {
                Text("Temperature \(wether.temperature)°C")
                Text("Description \(wether.description)")
            } else {
                
            }
        }
    }
}

#Preview {
    WeatherView()
}
