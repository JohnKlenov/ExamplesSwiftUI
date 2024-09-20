//
//  ServicePassthrough.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 15.09.24.
//

import Combine
import Foundation


class WeatherService {
    
    /// Just используется для создания простого издателя, который выдает одно значение и не может завершиться с ошибкой.
    /// setFailureType(to: Error.self): Преобразует тип ошибки издателя в Error. Это необходимо, так как Just по умолчанию не может завершиться с ошибкой, а для совместимости с другими издателями в цепочке требуется тип ошибки.
    /// delay(for: 1.0, scheduler: RunLoop.main): Задерживает выдачу значения на 1 секунду, используя RunLoop.main в качестве планировщика. Это полезно для симуляции задержки, например, сетевого запроса.
    /// eraseToAnyPublisher(): Преобразует издателя в AnyPublisher, что скрывает конкретный тип издателя и упрощает работу с ним в дальнейшем12.
    
    
    //симулирует сетевой запрос для получения данных о погоде(в реальном сервисе нам Just не очень подойдет так как возможна ошибка ).
    func fetchWether(city: String) -> AnyPublisher<Weather, Error> {
        let weather = Weather(temperature: Double.random(in: 0..<40), description: "Summer")
        return Just(weather)
            .setFailureType(to: Error.self)
            .delay(for: 1.0, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
