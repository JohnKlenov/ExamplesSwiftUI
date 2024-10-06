//
//  CardRepository.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 1.10.24.
//

import Foundation

// 1
//import FirebaseFirestore
//import FirebaseFirestoreSwift
import Combine

// 2
class CardRepository: ObservableObject {
  // 3
  private let path: String = "cards"
//  private let store = Firestore.firestore()

  // 1
  @Published var cards: [Card] = []

  // 1
  var userId = ""
  // 2
  private let authenticationService = AuthenticationService()
  // 3
  private var cancellables: Set<AnyCancellable> = []

  init() {
    // 1
    authenticationService.$user
      .compactMap { user in
        user?.uid
      }
      .assign(to: \.userId, on: self)
      .store(in: &cancellables)

    // 2
    authenticationService.$user
      .receive(on: DispatchQueue.main)
      .sink { [weak self] _ in
        // 3
          
        self?.get()
          print("get()")
      }
      .store(in: &cancellables)
  }

  func get() {
    // 3
//    store.collection(path)
//      .whereField("userId", isEqualTo: userId)
//      .addSnapshotListener { querySnapshot, error in
//        // 4
//        if let error = error {
//          print("Error getting cards: \(error.localizedDescription)")
//          return
//        }
//
//        // 5
//        self.cards = querySnapshot?.documents.compactMap { document in
//          // 6
//          try? document.data(as: Card.self)
//        } ?? []
//      }
      
      if userId == "" { return }
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          print("did finish asyncAfter")
          self.cards = testData
      }
      
  }

  // 4
  func add(_ card: Card) {
//    do {
//      var newCard = card
//      newCard.userId = userId
//        ///добавляет новый документ в коллекцию Firestore. При этом Firestore автоматически генерирует уникальный идентификатор для этого документа, если вы не указываете его явно
//      _ = try store.collection(path).addDocument(from: newCard)
//    } catch {
//      fatalError("Unable to add card: \(error.localizedDescription).")
//    }
  }

  func update(_ card: Card) {
//     1
//    guard let cardId = card.id else { return }
//
//    // 2
//    do {
//      // 3
//      try store.collection(path).document(cardId).setData(from: card)
//    } catch {
//      fatalError("Unable to update card: \(error.localizedDescription).")
//    }
  }

  func remove(_ card: Card) {
//    // 1
//    guard let cardId = card.id else { return }
//
//    // 2
//      ///Когда вы удаляете документ с помощью store.collection(path).document(cardId).delete(), вы используете идентификатор, который был автоматически сгенерирован Firestore при добавлении документа. Поэтому важно, чтобы у вашего объекта Card было поле id, содержащее этот идентификатор, чтобы вы могли корректно удалить документ.
//    store.collection(path).document(cardId).delete { error in
//      if let error = error {
//        print("Unable to remove card: \(error.localizedDescription)")
//      }
//    }
  }
}

