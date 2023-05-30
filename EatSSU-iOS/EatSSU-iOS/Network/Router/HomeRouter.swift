//
//  HomeRouter.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/27.
//

import Foundation

import Moya

//enum HomeRouter {
//    case morningMenuTable(menuId: String)
//}
//
//extension HomeRouter: TargetType {
//    var baseURL: URL {
//        return URL (string: Config.baseURL)!
//    }ㅔ
//
//    var path: String {
//        switch self {
//        case .morningMenuTable(let menuId):
//            return "\(menuId)"
//        }
//    }
//
//    var method: Moya.Method {
//        switch self {
//        case .morningMenuTable:
//            return .get
//        }
//    }
//
//    var task: Moya.Task {
//        switch self {
//        case .morningMenuTable:
//            return .requestPlain
//        }
//    }
//
//    var headers: [String : String]? {
//        return ["Content-Type":"application/json"]
//    }
//}

import Foundation
import Moya

enum HomeRouter {
    case getRestaurantMenu(restaurant: String)
}

extension HomeRouter: TargetType {
    var baseURL: URL {
        return URL (string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .getRestaurantMenu:
            return "/menu"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getRestaurantMenu:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getRestaurantMenu(let restaurant):
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
