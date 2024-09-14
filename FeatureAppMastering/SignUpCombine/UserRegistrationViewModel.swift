//
//  UserRegistrationViewModel.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 7.09.24.
//



//C iOS 17 ObservableObject deprecated
/// смотри заметку property wrappers SwiftUI


import Foundation
import Combine

class UserRegistrationViewModel: ObservableObject {
    
    // Ввод
    @Published var userLogin = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    
    // Вывод
    @Published var isLoginLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        /// $userLogin источник изменения значений, который мы хотим слушать.
        $userLogin
        /// последующие операции должны выполняться на главном потоке, что важно для обновления пользовательского интерфейса.
            .receive(on: RunLoop.main)
        ///функция map является оператором в Combine(преобразует значение пароля. Внутри блока map), принимает ввод, обрабатывает его и преобразует ввод в то, что ожидает подписчик.
            .map { userLogin in
                return userLogin.count >= 4
            }
        ///создает универсального подписчика для получения значений, назначает результат валидации (true/false) непосредственно свойству isUsernameLengthValid.
            .assign(to: \.isLoginLengthValid, on: self)
            .store(in: &cancellableSet)
        
        ///Первый подписчик проверяет длину пароля и назначает результат свойству isPasswordLengthValid.
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)
        
        ///Второй подписчик проверяет наличие заглавной буквы.
        $password.receive(on: RunLoop.main)
            .map { password in
                ///Определяется регулярное выражение для поиска заглавных букв.
                let pattern = "[A-Z]"
                ///Проверяется, есть ли в пароле хотя бы одна заглавная буква.
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
        ///Результат проверки присваивается свойству isPasswordCapitalLetter в вашей модели данных.
            .assign(to: \.isPasswordCapitalLetter, on: self)
        ///Функция assign, которая создает подписчика, возвращает экземпляр, который можно отменить. Вы можете использовать этот экземпляр, чтобы отменить подписку в нужное время.
        ///Если не сохранить ссылку, приложение может столкнуться с проблемами утечки памяти.
            .store(in: &cancellableSet)
        
        /// Этот оператор объединяет два издателя ($password и $passwordConfirm), чтобы отслеживать изменения обоих полей одновременно.
        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { password, passwordConfirm in
                return !passwordConfirm.isEmpty && (password == passwordConfirm)
            }
            .assign(to: \.isPasswordConfirmValid, on: self)
        /// Этот метод сохраняет подписку в коллекцию cancellableSet
        /// Таким образом, .store(in: &cancellableSet) гарантирует, что подписка будет отменена, когда объект, содержащий cancellableSet, будет деинициализирован.
            .store(in: &cancellableSet)
        
    }
}
