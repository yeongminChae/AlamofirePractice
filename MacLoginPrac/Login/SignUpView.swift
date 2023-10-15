//
//  ContentView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/26.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State var toCreateProfile: Bool = false

    var body: some View {
        VStack {
            VStack {
                TextField("Email", text: $viewModel.email).padding().border(.red)
                TextField("Password", text: $viewModel.password).padding().border(.red)
            }
            
            NavigationLink(
                destination: ProfileCreateView(viewModel: viewModel),
                isActive: $toCreateProfile) {
                    Button(action: { toCreateProfile.toggle() }) {
                        Text("Sign Up")
                            .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
                    }
                }
        }
        .padding()
        .onAppear() {
            viewModel.isSingedIn = false
            viewModel.isSignednUp = false
        }
    }
}
