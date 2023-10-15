//
//  AnyView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/27.
//

import SwiftUI

struct AnyView: View {
    @ObservedObject var viewModel: LoginViewModel
    var body: some View {
        VStack {
            Text("ji")
        }

    }
}

#Preview {
    @ObservedObject var viewModel: LoginViewModel
    AnyView(viewModel: viewModel)
}
