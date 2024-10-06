//
//  Card.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 1.10.24.
//

import Foundation
//import FirebaseFirestoreSwift

///Аннотация @DocumentID в Firebase используется для автоматического присвоения идентификатора документа переменной в вашей модели данных. Когда вы используете Firestore для хранения данных, каждый документ в коллекции имеет уникальный идентификатор. Аннотация @DocumentID позволяет вам автоматически получать этот идентификатор и сохранять его в переменной, что упрощает работу с документами.

struct Card: Identifiable, Codable {
    //  @DocumentID var id: String?
    var id: UUID = UUID()
    var question: String
    var answer: String
    var successful: Bool = true
    var userId: String?
}

/// imitation Firebase User
class UserImitation {
    let uid:String
    
    init(uid: String) {
        self.uid = uid
    }
}

#if DEBUG
let testData = (1...10).map { i in
  Card(question: "Question #\(i)", answer: "Answer #\(i)")
}
#endif
