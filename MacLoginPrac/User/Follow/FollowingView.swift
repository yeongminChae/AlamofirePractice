//
//  Followview.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/10/03.
//

import SwiftUI

struct FollowingView: View {
    @StateObject var memberViewModel = MemberViewModel()
    @ObservedObject var buskingViewModel: BuskingViewModel
    @ObservedObject var artistViewModel: ArtistViewModel
    @ObservedObject var userViewModel: LoginViewModel
    @Binding var artistId: Int

    var body: some View {
        VStack {
            List(artistViewModel.artists, id: \.id) { artist in
                HStack() {
                    HStack {
                        Text(String(artist.id))
                        Text(artist.stageName)
                        Button(action: {
                            artistId = artist.id
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25 ) {
                                artistViewModel.followArtist(userId: userViewModel.user?.id ?? 0, artistId: artist.id)
                            }
                        }, label: {
                            Text("Follow").foregroundStyle(.blue)
                        })
                    }
                    .frame(maxWidth: .infinity)

                    NavigationLink(destination: ArtistBuskingView(artistViewModel: artistViewModel, buskingViewModel: buskingViewModel, memberViewModel: memberViewModel, artistId: $artistId)) {
                        Text("")
                    }
                }

            }
            .onAppear() {
                artistViewModel.fetchArtists()
            }
        }
    }
}

