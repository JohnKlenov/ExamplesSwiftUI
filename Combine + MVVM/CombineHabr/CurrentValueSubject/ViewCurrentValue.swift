//
//  ViewCurrentValue.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 16.09.24.
//

import SwiftUI

struct UserView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.users) { user in
                Text(user.name)
            }
            Button(action: {
                let newUser = User(id: viewModel.users.count + 1, name: "\(viewModel.users.count + 1)")
                viewModel.addUser(user: newUser)
            }, label: {
                Text("AddUser")
            })
        }
    }
}

#Preview {
    UserView()
}
