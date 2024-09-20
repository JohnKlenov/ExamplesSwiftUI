//
//  ModelMerge+ViewModelMerge.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 16.09.24.
//

import Foundation
import Combine


struct WeatherMerge: Identifiable {
    let id = UUID()
    let temperature:Double
    let description:String
}


class WeatherViewModelMerge: ObservableObject {
    
    @Published var weather:WeatherMerge?
    private var cancellabel = Set<AnyCancellable>()
    
    private let localWeatherPublisher = PassthroughSubject<WeatherMerge,Never>()
    private let remoteWeatherPublisher = PassthroughSubject<WeatherMerge,Never>()
    
    //WeatherViewModel использует два PassthroughSubject для публикации данных о погоде из локального кэша и удаленного API. Оператор merge объединяет эти два потока данных.
    init() {
        let mergePublisher = localWeatherPublisher
            .merge(with: remoteWeatherPublisher)
            .receive(on: DispatchQueue.main)
        
        mergePublisher
            .sink { [weak self] weather in
                self?.weather = weather
            }
            .store(in: &cancellabel)
    }
    
    
    //Предположим, у нас есть приложение для отображения погоды, которое получает данные из двух разных источников: локального кэша и удаленного API. Мы хотим объединить эти два источника данных и отобразить их в интерфейсе пользователя.
    func fetchWeather() {
        
        localWeatherPublisher.send(WeatherMerge(temperature: 20.0, description: "Sunny"))
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            self.remoteWeatherPublisher.send(WeatherMerge(temperature: 22.0, description: "Partly Cloudy"))
        }
    }
}
