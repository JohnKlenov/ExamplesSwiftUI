//
//  SignUpView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 5.09.24.
//

import SwiftUI

struct SignUpView: View {
    
    /// следим за изменениями не храним
    /// если хотим следить и храить @StateObject.
    /// C iOS 17 ObservableObject deprecated  вместо @StateObject - @State,  @ObservedObject больше не нужен
    @ObservedObject private var userRegistrationViewModel = UserRegistrationViewModel()
    
    var body: some View {
        
        VStack {
            Text("Create account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)
            
            FormField(fieldName: "login", fieldValue: $userRegistrationViewModel.userLogin, isSecure: true)
            RequirementText(iconColor: userRegistrationViewModel.isLoginLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255) , text: "Минимум 4 символа", isStrikeThrough: userRegistrationViewModel.isLoginLengthValid)
                .padding()
            
            FormField(fieldName: "password", fieldValue: $userRegistrationViewModel.password)
            VStack {
                RequirementText(iconName: "lock.open",
                                iconColor: userRegistrationViewModel.isPasswordLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "Минимум 8 символов", isStrikeThrough: userRegistrationViewModel.isPasswordLengthValid)
                RequirementText(iconName: "lock.open", iconColor: userRegistrationViewModel.isPasswordLengthValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "Один символ с большой буквы", isStrikeThrough: userRegistrationViewModel.isPasswordLengthValid)
            }
            .padding()
            
            FormField(fieldName: "Подтвердите пароль", fieldValue: $userRegistrationViewModel.passwordConfirm, isSecure: true)
            RequirementText(text: "Пароль должен совпадать с введенным ранее", isStrikeThrough: userRegistrationViewModel.isPasswordConfirmValid)
                .padding()
                .padding(.bottom, 50)
            
            Button(action: {
                
            }, label: {
                Text("Зарегистрироваться")
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(Color(.white))
                    .bold()
                /// по умолчанию 16 point с каждой стороны
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                ///.cornerRadius(10) - depricated
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
            })
            
            HStack {
                Text("Уже есть аккаунт?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                Button(action: {
                    
                }, label: {
                    Text("Войти")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                })
            }
            .padding(.top, 50)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SignUpView()
}
