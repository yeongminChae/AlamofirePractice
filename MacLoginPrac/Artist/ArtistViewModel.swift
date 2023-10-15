//
//  ArtistViewModel.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/10/03.
//

import SwiftUI
import Alamofire

class ArtistViewModel: ObservableObject {
    @Published var artists: [Artist] = []
    @Published var artist: Artist?

    func fetchArtistById(artistId: Int) {
        AF.request("http://localhost:3000/artist-GET/\(artistId)", method: .get)
            .responseDecodable(of: Artist.self) { response in
                switch response.result {
                case .success(let artist) :
                    self.artist = artist
                case .failure(let error) :
                    print(error)
                }
            }
    }

    func fetchArtists() {
        AF.request("http://localhost:3000/artist-GET/All").responseDecodable(of: [Artist].self) { response in
            switch response.result {
            case .success(let artists) :
                self.artists = artists.map {Artist(artist: $0)}
            case .failure(let error) :
                print("Error : \(error)")
            }
        }
    }

    func followArtist(userId: Int, artistId: Int) {
        AF.request("http://localhost:3000/user-following/\(userId)/follow/\(artistId)", method: .post)
            .response { response in
                if let error = response.error {
                    print("Error: \(error)")
                } else {
                    print("Successfully followed artist")
                }
            }
    }
    
}
