//
//  ProfileImageView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/26.
//

import SwiftUI
import PhotosUI

struct ProfileImageView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var avatarItem: PhotosPickerItem? // 이미지 선택

    var body: some View {
        VStack {
            PhotosPicker("+", selection: $avatarItem, matching: .images)

            if let image = viewModel.avatarImage {
                Image(uiImage: image) // UIImage를 SwiftUI Image로 변환하여 사용
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        viewModel.avatarImage = uiImage // UIImage로 설정
                    }
                }
            }
        }
    }
}
