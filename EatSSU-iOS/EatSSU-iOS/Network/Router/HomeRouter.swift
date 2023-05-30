//
//  HomeRouter.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/27.
//

import Foundation
import Moya

enum HomeRouter {
    case getFixedRestaurantMenu(restaurant: String) // getRestaurantMenu
}

extension HomeRouter: TargetType {
    var baseURL: URL {
        return URL (string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .getFixedRestaurantMenu:
            return "/menu"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getFixedRestaurantMenu:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getFixedRestaurantMenu(let restaurant):
            return .requestParameters(parameters: ["restaurant": restaurant], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }
}
