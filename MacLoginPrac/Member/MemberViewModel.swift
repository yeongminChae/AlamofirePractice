//
//  MemberViewModel.swift
//  MacLoginPrac
//
//  Created by 채영민 on 10/13/23.
//

import SwiftUI
import Alamofire

class MemberViewModel: ObservableObject {
    @Published var members: [Member] = []

    func fetchMemberDataByArtist(artistId: Int) {
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "accessToken") ?? "")]
        AF.request("http://localhost:3000/member/getAll/\(artistId)", method: .get, headers: headers)
            .responseDecodable(of: [Member].self) { response in
                switch response.result {
                case .success(let members) :
                    self.members = members
                case .failure(let error) :
                    print(error)
                }
            }
    }
}
