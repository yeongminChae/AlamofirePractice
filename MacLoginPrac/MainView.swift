//
//  MainView.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/09/28.
//

import SwiftUI

struct MainView: View {
    @StateObject var artistViewModel = ArtistViewModel()
    @StateObject var buskingViewModel = BuskingViewModel()
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var followViewModel: FollowViewModel

    @State var isLoggedOut: Bool = false
    @State var artistId: Int = 0

    var body: some View {
        VStack {
            Text(viewModel.user?.username ?? "No Data")
            Text(String(viewModel.user?.id ?? 0))
            AsyncImage(url: URL(string: viewModel.user?.avatarUrl ?? "")) { phase in
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

            VStack {
                HStack{
                    Text("userId : \(viewModel.user?.id ?? 0) Following")
                    NavigationLink(destination: UseFollowBuskingView(userviewModel: viewModel, followViewModel: followViewModel, buskingViewModel: buskingViewModel)) {
                        Text("->")
                    }
                }
                List(followViewModel.following) { artist in
                    HStack {
                        Text(artist.stageName)
                        Spacer()
                        UnfollowBtn(artistIdVar: artist.id)
                    }
                }
                .refreshable {
                    FollowUserArtist()
                }

            }

            FollowingView(buskingViewModel: buskingViewModel, artistViewModel: artistViewModel, userViewModel: viewModel, artistId: $artistId)

            NavigationLink(
                destination: LoginView(viewModel: viewModel),
                isActive: $isLoggedOut) {
                    Button(action: {
                        ButtonAction()
                    }) {
                        Text("Log Out")
                    }
                }

        }
        .onAppear {
            viewModel.getProfile()
            FollowUserArtist()
        }
        .onChange(of: artistId) { newValue in
            followViewModel.fetchArtistData(artistId: newValue)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3 ) {
                FollowUserArtist()
            }
        }
        .onChange(of: viewModel.user?.id) { newValue in
            followViewModel.fetchUserData(userId: newValue ?? 0)
        }
    }

    func ButtonAction() {
        UserDefaults.standard.removeObject(forKey: "accessToken")
        isLoggedOut = true
        viewModel.isSingedIn = false
        viewModel.isSignednUp = false
        viewModel.initStates()
    }

    func FollowUserArtist() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25 ) {
            followViewModel.fetchUserData(userId: viewModel.user?.id ?? 0)
            followViewModel.fetchArtistData(artistId: artistId)
        }
    }

    func UnfollowBtn(artistIdVar: Int) -> some View {
        Button(action: {
            followViewModel.unfollowArtist(userId: viewModel.user?.id ?? 0, artistId: artistIdVar)
        }) {
            Text("Unfollow")
        }
    }
}
