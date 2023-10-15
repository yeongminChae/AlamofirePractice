//
//  ContentView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/26.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    TextField("Email", text: $viewModel.email).padding().border(.red)
                    TextField("Password", text: $viewModel.password).padding().border(.red)
                }
                NavigationLink("Sign Up", value: viewModel.email)
                    .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
            }
            .navigationDestination(for: String.self) { _ in
                ProfileCreateView(viewModel: viewModel)
            }
            .padding()
        }
    }
}
