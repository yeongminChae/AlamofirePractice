//
//  ArtistBuskingView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 10/11/23.
//

import SwiftUI

struct ArtistBuskingView: View {
    @ObservedObject var artistViewModel: ArtistViewModel
    @ObservedObject var buskingViewModel: BuskingViewModel
    @ObservedObject var memberViewModel: MemberViewModel
    @Binding var artistId: Int

    var body: some View {
        VStack {
            Text("Hello this is artist \(artistId)")
            AsyncImage(url: URL(string: artistViewModel.artist?.artistImage ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image) :
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                case .failure(_):
                    Image("fail")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                @unknown default:
                    EmptyView()
                }
            }
            
            List(memberViewModel.members, id: \.id) { member in
                HStack {
                    Text(member.memberName)
                    Text(member.memberInfo)
                    AsyncImage(url: URL(string: member.memberImage)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image) :
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 200)
                        case .failure(_):
                            Image("fail")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 200)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }

            List(buskingViewModel.buskings, id: \.id) { busking in
                HStack {
                    Text(busking.BuskingInfo)
                }
            }
            .task() {
                artistViewModel.fetchArtistById(artistId: artistId)
                buskingViewModel.fetchBuskingDataByArtist(artistId: artistId)
                memberViewModel.fetchMemberDataByArtist(artistId: artistId)
            }
        }
    }
}
