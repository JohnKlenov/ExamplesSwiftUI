//
//  ResultCH№2.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 26.09.24.
//

import Combine
import SwiftUI


//Result Publisher может быть любым Publisher, который передает значения типа Result. Это может быть PassthroughSubject, CurrentValueSubject, URLSession.DataTaskPublisher и другие.

//Result - Помогает обрабатывать успешные и ошибочные результаты в реактивном стиле.


class ViewModelResult: ObservableObject {
    @Published var resultMessage: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    func fetchData() {
        let url = URL(string: "https://api.example.com/data")!
        
        ///Используем URLSession для создания Publisher, который выполняет сетевой запрос по указанному URL.
        URLSession.shared.dataTaskPublisher(for: url)
        ///Используем оператор map для преобразования полученных данных в Result. В данном случае мы просто возвращаем успешный результат с сообщением.
            .map { data, response in
                Result<String, Error>.success("Data fetched successfully!")
            }
        ///Если возникает ошибка, мы возвращаем Result.failure с этой ошибкой.
            .catch { error in
                Just(Result<String, Error>.failure(error))
            }
            .sink { result in
                switch result {
                case .success(let message):
                    self.resultMessage = message
                case .failure(let error):
                    self.resultMessage = "Error: \(error.localizedDescription)"
                }
            }
            .store(in: &cancellables)
    }
}

//struct ContentView: View {
//    @StateObject private var viewModel = ViewModel()
//    
//    var body: some View {
//        VStack {
//            Text(viewModel.resultMessage)
//                .padding()
//            Button("Fetch Data") {
//                viewModel.fetchData()
//            }
//        }
//        .onAppear {
//            viewModel.fetchData()
//        }
//    }
//}
