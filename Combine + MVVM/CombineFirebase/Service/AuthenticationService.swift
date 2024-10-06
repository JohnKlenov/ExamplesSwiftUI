//
//  AuthenticationService.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 1.10.24.
//

import Foundation
//import Firebase

// 1
class AuthenticationService: ObservableObject {
  // 2
    
//  @Published var user: User?
//  private var authenticationStateHandler: AuthStateDidChangeListenerHandle?
    @Published var user: UserImitation?

  // 3
  init() {
    addListeners()
  }

  // 4
  static func signIn() {
//    if Auth.auth().currentUser == nil {
//      Auth.auth().signInAnonymously()
//    }
  }

  private func addListeners() {
    // 5
//    if let handle = authenticationStateHandler {
//      Auth.auth().removeStateDidChangeListener(handle)
//    }

    // 6
//    authenticationStateHandler = Auth.auth()
//      .addStateDidChangeListener { _, user in
//        self.user = user
//      }
//      if let user = user {
//          return
//      }
      guard user == nil else {
          return
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
          self.user = UserImitation(uid: "38dh99c8hh38d8")
          print("UserImitation")
      }
  }
}
