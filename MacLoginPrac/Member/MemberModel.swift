//
//  MemberModel.swift
//  MacLoginPrac
//
//  Created by 채영민 on 10/13/23.
//

import SwiftUI

struct Member: Identifiable, Hashable, Decodable {
    let id: Int
    let memberName: String
    let memberInfo: String
    let memberImage: String

    init(member: Member) {
        self.id = member.id
        self.memberName = member.memberName
        self.memberInfo = member.memberInfo
        self.memberImage = member.memberImage
    }
}
