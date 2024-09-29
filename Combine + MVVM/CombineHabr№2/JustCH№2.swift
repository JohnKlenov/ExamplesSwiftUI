//
//  JustCH№2.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 26.09.24.
//

import SwiftUI
import Combine


//Just — это паблишер, который генерирует событие всего один раз, а потом замолкает.

//Используется в качестве начальной цепочки Data stream

class JustExample {
    
    let stringPublisher: Just<String> = Just("?")
    var cancellables = Set<AnyCancellable>()
    
    init () {
        stringPublisher
            .sink(
                receiveCompletion: { completion in
                    print("completion status: \(completion)")
                }, receiveValue: { value in
                    print("received value: \(value)")
                }
            )
            .store(in: &cancellables)
    }
}



// MARK: Consol

//received value: ?
//completion status: finished




//он всегда генерирует событие (в отличие от опционала). 
//Например, если в качестве output мы поставим опциональный String,а остальной код оставим как есть, то в консоли увидим следующее:

//Второй особенностью Just является то, что его тип ошибки — Never, то есть он никогда не может завершиться с ошибкой. 
//Даже если мы укажем опциональный тип данных и придет nil, подписчик решит, что это не ошибка и с этими данными можно работать.

class JustExample2 {
    
    let stringPublisher: Just<String> = Just("?")
    var cancellables = Set<AnyCancellable>()
    
    init () {
        stringPublisher
            .sink(
                receiveCompletion: { completion in
                    print("completion status: \(completion)")
                }, receiveValue: { value in
                    print("received value: \(value)")
                }
            )
            .store(in: &cancellables)
    }
}


// MARK: Consol

//recieved value: nil
//completion status: finished
