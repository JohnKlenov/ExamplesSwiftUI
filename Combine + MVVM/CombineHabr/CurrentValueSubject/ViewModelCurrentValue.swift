//
//  ViewModelCurrentValue.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 16.09.24.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    private var cancebellabel = Set<AnyCancellable>()
    // Используем CurrentValueSubject для хранения и публикации данных
    private var userSubject = CurrentValueSubject<[User], Never>([])
    
    init() {
        // Подписываемся на изменения в usersSubject и обновляем @Published свойство
        userSubject
            .sink { users in
                self.users = users
            }
            .store(in: &cancebellabel)
    }
    
    //В реальном приложении метод addUser(_ user: User) может симулировать добавление пользователя на сервер, и при успешном завершении операции обновляется CurrentValueSubject.
    func addUser(user:User) {
        var currentUsers = userSubject.value
        currentUsers.append(user)
        userSubject.send(currentUsers)
    }
}
