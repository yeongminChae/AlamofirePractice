//
//  MyFollowDetailView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 10/11/23.
//

import SwiftUI
import Combine

struct UseFollowBuskingView: View {
    @ObservedObject var userviewModel: LoginViewModel
    @ObservedObject var followViewModel: FollowViewModel
    @ObservedObject var buskingViewModel: BuskingViewModel

    @State private var artistId: Int = 0

    var body: some View {
        VStack {
            Text(userviewModel.user?.username ?? "No user")
            
            Spacer()
            ForEach(followViewModel.following) { artist in
                Text("artistId : \(artist.id)")
                List(artist.buskings) {busking in
                    HStack {
                        Text("busking.id : \(busking.id)")
                        Text(busking.BuskingInfo)
                    }
                }
            }
        }
        .onAppear() {
            followViewModel.fetchUserData(userId: userviewModel.user?.id ?? 0)
        }
    }
}
