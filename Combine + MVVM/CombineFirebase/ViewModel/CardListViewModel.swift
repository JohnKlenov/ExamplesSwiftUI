//
//  CardListViewModel.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 3.10.24.
//

import Foundation
// 1
import Combine

// 2
class CardListViewModel: ObservableObject {
  // 1
  @Published var cardViewModels: [CardViewModel] = []
  // 2
  private var cancellables: Set<AnyCancellable> = []

  // 3
  @Published var cardRepository = CardRepository()

  init() {
    // 1
    ///Когда вы видите запись CardViewModel.init в контексте функции map, это сокращенная форма вызова инициализатора, которая позволяет создать новый экземпляр CardViewModel для каждого элемента массива.
    cardRepository.$cards.map { cards in
      cards.map(CardViewModel.init)
    }
    // 2
    .assign(to: \.cardViewModels, on: self)
    // 3
    .store(in: &cancellables)
  }

  // 4
  func add(_ card: Card) {
    cardRepository.add(card)
  }
}
