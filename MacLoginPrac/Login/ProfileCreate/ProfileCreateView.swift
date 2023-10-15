//
//  ProfileCreateView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/26.
//

import SwiftUI

struct ProfileCreateView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            Circle()
                .strokeBorder(lineWidth: 2)
                .overlay(ProfileImageView(viewModel: viewModel))
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)

            TextField("Username", text: $viewModel.username).padding().border(.blue)

            NavigationLink(
                destination: LoginView(viewModel: viewModel),
                isActive: $viewModel.isSignednUp) {
                    Button(action: { viewModel.signUp() }) {
                        Text("Create")
                            .disabled(viewModel.username.isEmpty)
                    }
                }
        }
    }
}

