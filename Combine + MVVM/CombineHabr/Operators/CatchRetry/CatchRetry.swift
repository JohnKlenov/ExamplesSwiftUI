//
//  CatchRetry.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 20.09.24.
//

import Foundation





// MARK: - Catch -


// MARK: Basic example

//import Combine
//
//enum MyError: Error {
//    case somethingWentWrong
//}
//
//let publisher = PassthroughSubject<Int, MyError>()


//let caughtPublisher = publisher.catch { error in
//    return Just(-1) // Возвращаем альтернативное значение в случае ошибки
//}


//let subscription = caughtPublisher.sink(
//    receiveCompletion: { completion in
//        switch completion {
//        case .finished:
//            print("Finished")
//        case .failure(let error):
//            print("Error: \(error)")
//        }
//    },
//    receiveValue: { value in
//        print("Received value: \(value)")
//    }
//)
//
//// Отправка значений и ошибки
//publisher.send(1)
//publisher.send(completion: .failure(.somethingWentWrong))




// MARK: CloudFirestore request


//Future в Combine используется для представления асинхронной операции, которая завершится либо успехом, либо ошибкой. Это удобный способ обернуть асинхронные задачи, такие как сетевые запросы, в Publisher, который можно использовать с другими операторами Combine.



//import Combine
//import FirebaseFirestore

//enum FirestoreError: Error {
//    case requestFailed
//}
//
//func fetchDataFromFirestore() -> AnyPublisher<[String: Any], FirestoreError> {
//    Future { promise in
//        let db = Firestore.firestore()
//        db.collection("yourCollection").getDocuments { (snapshot, error) in
//            if let error = error {
//                promise(.failure(.requestFailed))
//            } else if let documents = snapshot?.documents {
//                let data = documents.map { $0.data() }
//                promise(.success(data))
//            }
//        }
//    }
//    .eraseToAnyPublisher()
//}

//let firestorePublisher = fetchDataFromFirestore()
//    .catch { error -> Just<[String: Any]> in
//        print("Error fetching data: \(error)")
//        return Just([:]) // Возвращаем пустой словарь в случае ошибки
//    }
//    .eraseToAnyPublisher()

//
//let subscription = firestorePublisher.sink(
//    receiveCompletion: { completion in
//        switch completion {
//        case .finished:
//            print("Finished")
//        case .failure(let error):
//            print("Error: \(error)")
//        }
//    },
//    receiveValue: { data in
//        print("Received data: \(data)")
//    }
//)




// MARK: - Retry -




// MARK: Use case 1

//import Combine
//import Foundation
//
//enum NetworkError: Error {
//    case requestFailed
//}
//
//let publisher = PassthroughSubject<Int, NetworkError>()
//
//publisher
//    .retry(3) // Попытаться заново до 3 раз
//    .sink(receiveCompletion: { completion in
//        switch completion {
//        case .finished:
//            print("Finished successfully")
//        case .failure(let error):
//            print("Failed with error: \(error)")
//        }
//    }, receiveValue: { value in
//        print("Received value: \(value)")
//    })
//
//// Эмулируем ошибку
//publisher.send(completion: .failure(.requestFailed))



// MARK: Use case 2


//Deferred — это Publisher, который откладывает создание другого Publisher до момента подписки.
//
//Deferred создает Publisher только тогда, когда на него подписываются. В данном случае, каждый раз, когда на retryingPublisher подписываются, выполняется замыкание, увеличивающее attemptCount на 1.


//import Combine
//
//var attemptCount = 0
//
//let retryingPublisher = Deferred {
//    attemptCount += 1
//    return attemptCount < 3 ? Fail(error: URLError(.badServerResponse)) : Just("Success")
//}
//.retry(3) // Повторяем до трех раз
//.sink(
//    receiveCompletion: { completion in
//        switch completion {
//        case .finished:
//            print("Completed successfully")
//        case .failure(let error):
//            print("Failed with error: \(error)")
//        }
//    },
//    receiveValue: { value in
//        print("Received value: \(value)")
//    }
//)
//
//// Вывод: "Received value: Success"
