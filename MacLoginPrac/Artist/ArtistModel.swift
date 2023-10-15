//
//  ArtistModel.swift
//  MacLoginPrac
//
//  Created by 채영민 on 2023/10/03.
//

import SwiftUI

struct Artist: Identifiable, Decodable, Hashable {
    let id: Int
    let stageName: String
    let artistInfo: String
    let genres: String
    let artistImage: String?
//    let user: User
    let members: [Member]
    let buskings: [Busking]

    init(artist: Artist) {
        self.id = artist.id
        self.stageName = artist.stageName
        self.artistInfo = artist.artistInfo
        self.genres = artist.genres
        self.artistImage = artist.artistImage
        self.members = artist.members
        self.buskings = artist.buskings
    }
}
