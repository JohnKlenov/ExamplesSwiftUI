//
//  MapFlatMapFilter.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 17.09.24.
//

import Foundation
import Combine


//let rawInputs = [1.5, 0.9, 2.5, 3.7, 1.8].publisher
//
//let processedInputs = rawInputs
//    .filter { $0 < 3.0 } // Оставляем только допустимые значения
//    .map { $0 / 3.0 } // Нормализуем данные
//
//processedInputs.sink { value in
//    print("Processed input: \(value)")
//}



//import Foundation
//
//let userInput = PassthroughSubject<String, Never>()
//let searchResults = userInput.flatMap { query in
//    URLSession.shared.dataTaskPublisher(for: URL(string: "https://api.example.com/search?q=\(query)")!)
//        .map { $0.data }
//        .decode(type: [String].self, decoder: JSONDecoder())
//        .catch { _ in Just([]) }  // Обрабатываем возможные ошибки
//}
//
//searchResults.sink { results in
//    print("Search results: \(results)")
//}
//
//userInput.send("apple")
