//
//  ViewModelCombineLatest.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 16.09.24.
//

import Foundation
import Combine

//class ViewModelCombineLatest:ObservableObject {
//    @Published var text1:String = ""
//    @Published var text2:String = ""
//    @Published var combinedText:String = ""
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    init() {
//        Publishers.CombineLatest($text1, $text2)
//            .map { text1, text2 in
//                return "Combined: \(text1) + \(text2)"
//            }
//            .assign(to: \.combinedText, on: self)
//            .store(in: &cancellables)
//    }
//}


class ViewModelZip:ObservableObject {
    
    var pub1 = PassthroughSubject<String, Never>()
    var pub2 = PassthroughSubject<String, Never>()
    
    @Published var combinedText:String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        let zipped = pub1.zip(pub2)
//        let zipped = pub1.combineLatest(pub2)

         zipped.sink { text1, text2 in
            self.combinedText = "Combined: \(text1) + \(text2)"
        }
         .store(in: &cancellables)
    }
}
