//
//  BuskingModel.swift
//  MacLoginPrac
//
//  Created by 채영민 on 10/10/23.
//

import SwiftUI

struct Busking: Identifiable, Hashable, Decodable {
    let id: Int
    let longitude: Double
    let latitude: Double
    let BuskingInfo: String
    let BuskingStartTime: String
    let BuskingEndTime: String
//    let artistId: Int

    init(busking: Busking) {
        self.id = busking.id
        self.longitude = busking.longitude
        self.latitude = busking.latitude
        self.BuskingInfo = busking.BuskingInfo
        self.BuskingStartTime = busking.BuskingStartTime
        self.BuskingEndTime = busking.BuskingEndTime
//        self.artistId = busking.artistId
    }
}
