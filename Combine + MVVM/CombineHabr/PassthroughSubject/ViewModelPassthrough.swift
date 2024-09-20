//
//  ViewModelPassthrough.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 15.09.24.
//

import Combine
import Foundation


///debounce - дебаунсинг, что означает, что значения будут передаваться только если прошло 0.5 секунды с момента последнего ввода. Это помогает избежать частых запросов при быстром вводе пользователем.
///flatMap - Преобразует каждое значение (название города) в новый издатель, который выполняет сетевой запрос для получения данных о погоде. flatMap используется для работы с издателями, которые возвращают другие издатели.
///sink - Подписывается на издателя, который возвращает flatMap. Таким образом, sink получает значения, которые возвращает fetchWeather(for:) - Just(weather).

//ViewModel: WeatherViewModel использует PassthroughSubject для получения ввода от пользователя и передачи его в сервис для получения данных. Результаты сохраняются в @Published свойстве, чтобы обновить UI.
class WeatherViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    private var weatherService = WeatherService()
    
    @Published var weather:Weather?
    
    ///использует PassthroughSubject для получения ввода от пользователя и передачи его в сервис для получения данных.
    ///мы используем Just(weather) что бы вынести логику хождение в сеть в отдельную сущность.
    var citySubject = PassthroughSubject<String, Never>()
    
    init() {
        citySubject
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .flatMap { [unowned self] city in
                self.weatherService.fetchWether(city: city)
            }
            .receive(on: RunLoop.main)
            .sink { _ in } receiveValue: { [unowned self] weather in
                self.weather = weather
            }
            .store(in: &cancellables)
    }
}
