//
//  ViewMerge.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 16.09.24.
//

import SwiftUI

struct ViewMerge: View {
    
    @StateObject private var viewModel = WeatherViewModelMerge()
    
    var body: some View {
        VStack {
            if let weather = viewModel.weather {
                Text("Temperature \(weather.temperature)")
                Text("Description \(weather.description)")
            } else {
                Text("Loading ...")
            }
        }
        .onAppear{
            viewModel.fetchWeather()
        }
    }
}

#Preview {
    ViewMerge()
}
