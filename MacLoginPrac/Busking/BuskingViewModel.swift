//
//  BuskingViewModel.swift
//  MacLoginPrac
//
//  Created by 채영민 on 10/10/23.
//

import SwiftUI
import Alamofire

class BuskingViewModel: ObservableObject {
    @Published var buskings: [Busking] = []
    
    func fetchBuskingDataByArtist(artistId: Int) {
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "accessToken") ?? "")]
        AF.request("http://localhost:3000/busking/getAll/\(artistId)", method: .get , headers: headers)
            .responseDecodable(of: [Busking].self) { response in
                switch response.result {
                case .success(let buskings) :
                    self.buskings = buskings
                case .failure(let error) :
                    print(error)
                }
            }
    }
}
