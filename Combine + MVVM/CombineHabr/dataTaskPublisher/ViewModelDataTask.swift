//
//  ViewModelDataTask.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 14.09.24.
//

import Combine
import Foundation


@Observable class PostsViewModelDataTask {
    
    var posts:[PostDataTask] = []
    var isLoading = false
    /// Метод .store(in: &cancellables) используется для автоматического управления жизненным циклом подписок. Когда вы добавляете подписку в коллекцию cancellables, подписка будет автоматически отменена, когда экземпляр ViewModel будет деинициализирован. Это помогает избежать утечек памяти и гарантирует, что подписки будут корректно отменены, когда они больше не нужны.
    private var cancellables = Set<AnyCancellable>()
    
//    init() {
//        fetchPosts()
//    }
    
    func fetchPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        isLoading = true
        
        ///URLSession.shared.dataTaskPublisher - выполняет сетевой запрос по указанному URL и возвращает данные в виде Publisher
        ///.map - Преобразует результат запроса, извлекая только данные (data) из ответа.
        ///.catch - позволяет нам перехватывать и обрабатывать ошибки, не прерывая поток данных.
        ///.replaceError(with: []) - В случае ошибки заменяет результат на пустой массив, чтобы избежать сбоев в работе приложения.
        ///.receive - Указывает, что все последующие операции должны выполняться на главном потоке, что важно для обновления пользовательского интерфейса.
        ///.sink - Подписывается на Publisher и получает декодированные данные.
        
    
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [PostDataTask].self, decoder: JSONDecoder())
            .catch { error -> Just<[PostDataTask]> in
                    print("Ошибка при получении данных: \(error)")
                    return Just([])
                }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] posts in
                self?.posts = posts
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
}

