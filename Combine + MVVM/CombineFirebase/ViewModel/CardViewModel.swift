//
//  CardViewModel.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 3.10.24.
//

import Foundation
import Combine

// 1
class CardViewModel: ObservableObject, Identifiable {
  // 2
//  private let cardRepository = CardRepository()
  @Published var card: Card
  // 3
  private var cancellables: Set<AnyCancellable> = []
  // 4
  var id = ""

  init(card: Card) {
    self.card = card
    // 6
    $card
          .compactMap { $0.id.uuidString }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)
  }

  func update(card: Card) {
//    cardRepository.update(card)
  }

  func remove() {
//    cardRepository.remove(card)
  }
}
