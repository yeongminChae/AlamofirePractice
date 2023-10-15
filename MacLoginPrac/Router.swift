//
//  Router.swift
//  MacLoginPrac
//
//  Created by 채영민 on 10/11/23.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    public enum Destination: Codable, Hashable {
        case mainView
        case busking
        case followBusking
    }

}
