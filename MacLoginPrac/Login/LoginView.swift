//
//  LoginView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/27.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @StateObject var followViewModel = FollowViewModel()

    var body: some View {
        VStack(spacing: 10) {
            VStack {
                TextField("Email", text: $viewModel.email).padding().border(.blue)
                TextField("Password", text: $viewModel.password).padding().border(.blue)
            }
            NavigationLink(
                destination: MainView(viewModel: viewModel, followViewModel: followViewModel),
                isActive: $viewModel.isSingedIn) {
                    Button(action: { viewModel.signIn() }) {
                        Text("Log In")
                            .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
                    }
                }
            HStack {
                Text("회원가입 ->")
                NavigationLink(destination: SignUpView(viewModel: viewModel)) {
                    Text("Sign Up")
                }
            }
        }
        .padding()
    }
}
