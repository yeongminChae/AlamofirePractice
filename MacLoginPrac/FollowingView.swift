//
//  Followview.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/10/03.
//

import SwiftUI

struct FollowingView: View {
    @ObservedObject var artistViewModel: ArtistViewModel

    var body: some View {
        VStack {
            List(artistViewModel.artists, id: \.id) { artist in
                HStack {
                    Text(artist.stageName)
                    Text(artist.biography)
                    Spacer()
                    Button(action: {
                        print("Follow")
                    }, label: {
                        Text("Follow")
                    })
                }
            }
            .onAppear() {
                artistViewModel.fetchArtists()
            }
        }
    }
}

