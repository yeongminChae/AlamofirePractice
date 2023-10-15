//
//  File.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/10/07.
//

import SwiftUI
import Alamofire

class FollowViewModel: ObservableObject {
    @Published var followers: [User] = []
    @Published var following: [Artist] = []
    @Published var selectedArtistID: Int?

    func fetchArtistData(artistId: Int) {
        AF.request("http://localhost:3000/user-following/\(artistId)/followers")
            .responseDecodable(of: [User].self) { response in
                switch response.result {
                case .success(let users) :
                    self.followers = users
                case .failure(let error) :
                    print(error)
                }
            }
    }

    func fetchUserData(userId: Int) {
        AF.request("http://localhost:3000/user-following/\(userId)/following")
            .responseDecodable(of: [Artist].self) { response in
                switch response.result {
                case .success(let artists) :
                    self.following = artists
                case .failure(let error) :
                    print(error)
                }
            }
    }
    
    func unfollowArtist(userId: Int, artistId: Int) {
           AF.request("http://localhost:3000/user-following/\(userId)/unfollow/\(artistId)", method: .delete)
               .response { response in
                   switch response.result {
                   case .success:
                       print("Unfollow success")
                       self.fetchUserData(userId: userId)
                       self.fetchArtistData(artistId: artistId)
                   case .failure(let error):
                       print(error)
                   }
               }
       }

}
