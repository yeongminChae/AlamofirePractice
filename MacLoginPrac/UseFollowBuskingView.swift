//
//  MyFollowDetailView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 10/11/23.
//

import SwiftUI

struct UseFollowBuskingView: View {
//    @ObservedObject var artistViewModel: ArtistViewModel
    @ObservedObject var userviewModel: LoginViewModel
//    @ObservedObject var followViewModel: FollowViewModel
    
    var body: some View {
        Text(userviewModel.user?.username ?? "No user")
    }
}
