//
//  FutureCH№2.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 26.09.24.
//

import Combine
import SwiftUI


//Паблишер Future в Combine используется для представления асинхронной операции, которая завершится единственным значением или ошибкой.
//Идеальный для одноразовых асинхронных операций.


func fetchData() -> Future<Data, Error> {
    return Future { promise in
        // Выполнение асинхронной задачи
        URLSession.shared.dataTask(with: URL(string: "https://example.com")!) { data, response, error in
            if let error = error {
                promise(.failure(error))
            } else if let data = data {
                promise(.success(data))
            }
        }.resume()
    }
}

let futurePublisher = fetchData()
let cancellable = futurePublisher.sink(
    receiveCompletion: { completion in
        switch completion {
        case .finished:
            print("Завершено успешно")
        case .failure(let error):
            print("Ошибка: \(error)")
        }
    },
    receiveValue: { data in
        print("Полученные данные: \(data)")
    }
)



//Для плавного перехода на Combine используется паблишер — Future.


func fetchData(completion: @escaping (Result<Int, Error>) -> Void) {
    completion(.success(10))
}

///Благодаря Future мы можем обернуть метод старого сервиса и использовать его по месту вызова на реактивный лад:
func fetchDataAsPublisher() -> Future<Int, Error> {
    Future { promise in
        fetchData { completion in
            promise(completion)
        }
    }
}

