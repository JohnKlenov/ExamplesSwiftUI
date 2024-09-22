//
//  URLSessionCH№2.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 21.09.24.
//

import SwiftUI
import Combine

///URLSession.shared.dataTaskPublisher(for: url) - Создание паблишера, который выполняет сетевой запрос по указанному URL и публикует результат в виде пары (data: Data, response: URLResponse).
///.map { $0.data } - Преобразование опубликованного значения, извлекая только данные (Data) из пары (data, response).
///.decode(type: [String].self, decoder: JSONDecoder()) - Декодирование данных из формата JSON в массив строк с использованием JSONDecoder.
///.replaceError(with: []) - Замена любой ошибки пустым массивом строк. Это гарантирует, что паблишер никогда не будет публиковать ошибку.
///.subscribe(on: DispatchQueue.main) - Указание, что начальная подписка на паблишер и выполнение всех операторов до первого оператора, который изменяет поток выполнения, должны происходить на главном потоке. В данном случае этот оператор будет проигнорирован, так как dataTaskPublisher уже выполняется в фоновом потоке.
///.receive(on: DispatchQueue.main) - Указание, что все последующие операции должны выполняться на главном потоке. Это важно для обновления пользовательского интерфейса.
///.eraseToAnyPublisher() - Преобразование паблишера в тип AnyPublisher, чтобы скрыть детали реализации.


class FirstDataTaskPublisher {
    
    
    private var cancellables = Set<AnyCancellable>()
    let url = URL(string: "https://example.com/data.json")!
    
    //после вызова URLSession.shared.dataTaskPublisher(for: url) все операторы по умолчанию будут выполняться в фоновом потоке
    private func fetchData(from url: URL) -> AnyPublisher<[String], Never> {
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [String].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .subscribe(on: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    init() {
        let cancellable = fetchData(from: url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Загрузка завершена")
                case .failure(let error):
                    print("Произошла ошибка: \(error)")
                }
            }, receiveValue: { data in
                print("Полученные данные: \(data)")
            })
    }
    
}



///guard let url = URL(string: urlString) else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() } проверяет, является ли строка валидным URL. Если нет, возвращает ошибку.
///Fail(error: URLError(.badURL)) — это встроенный оператор в Combine, который позволяет создать паблишер, немедленно выдающий ошибку. Он доступен “из коробки” и не требует дополнительного написания кода.

///.map: Этот оператор используется для преобразования значений, публикуемых паблишером, и не может выбрасывать ошибки. Если в процессе преобразования может возникнуть ошибка, .map не подходит.
///.tryMap: Этот оператор аналогичен .map, но позволяет выбрасывать ошибки. В вашем коде он используется для проверки HTTP-ответа и выбрасывания ошибки, если статус-код не равен 200. Это позволяет обработать ошибки, возникающие в процессе преобразования данных.


class FirstDataTaskPublisherResponseError {
    
    
    private var cancellables = Set<AnyCancellable>()
//    let url = URL(string: "https://example.com/data.json")!
    
    
    init() {
        // Пример использования функции fetchData
        let urlString = "https://example.com/data.json"
        fetchData(from: urlString)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Загрузка завершена")
                case .failure(let error):
                    print("Произошла ошибка: \(error.localizedDescription)")
                }
            }, receiveValue: { data in
                print("Полученные данные: \(data)")
            })
            .store(in: &cancellables)
    }
    
    private func fetchData(from urlString: String) -> AnyPublisher<[String], Error> {
        // Проверка валидности URL
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                // Проверка HTTP-ответа
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [String].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
