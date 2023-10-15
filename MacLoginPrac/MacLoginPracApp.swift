//
//  MacLoginPracApp.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/26.
//

import SwiftUI

@main
struct MacLoginPracApp: App {
    @StateObject var viewModel = LoginViewModel()
    @StateObject var followViewModel = FollowViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if UserDefaults.standard.string(forKey: "accessToken") != nil {
                    MainView(viewModel: viewModel, followViewModel: followViewModel)
                        .onAppear() {
                            viewModel.getProfile()
                        }
                } else {
                    LoginView(viewModel: viewModel)
                }
            }
        }
    }
}
