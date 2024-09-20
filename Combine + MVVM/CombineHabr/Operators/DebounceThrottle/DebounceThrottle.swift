//
//  DebounceThrottle.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 20.09.24.
//

import Foundation


//import Combine
//import Foundation
//
//let searchTextPublisher = PassthroughSubject<String, Never>()
//
//let debouncedSearch = searchTextPublisher
//    .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
//    .sink { value in
//        print("Search query: \(value)")
//    }
//
//searchTextPublisher.send("S")
//searchTextPublisher.send("Sw")
//searchTextPublisher.send("Swi")
//searchTextPublisher.send("Swif")
//searchTextPublisher.send("Swift")
//// Через 500 мс после последнего ввода: "Search query: Swift"





//import Combine
//import Foundation
//
//let eventPublisher = PassthroughSubject<Void, Never>()
//
//let throttledEvents = eventPublisher
//    .throttle(for: .seconds(1), scheduler: RunLoop.main, latest: true)
//    .sink {
//        print("Event received")
//    }
//
//for _ in 1...5 {
//    eventPublisher.send()
//    Thread.sleep(forTimeInterval: 0.3) // Эмуляция частого срабатывания события
//}
//
//// Вывод: "Event received" будет напечатано только один раз в секунду
