//
//  UserModel.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/26.
//

import Foundation
import SwiftUI

struct User: Identifiable, Decodable, Hashable {
    let id: Int
    let email: String
    let username: String
    let password: String
    let avatarUrl: String

    init(user: User) {
        self.id = user.id
        self.username = user.username
        self.email = user.email
        self.password = user.password
        self.avatarUrl = user.avatarUrl
    }
}

// Login 기능
struct TokenResponse: Decodable {
    let accessToken: String
}

struct ImageModel {
    var image: UIImage?
}
