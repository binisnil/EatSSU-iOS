//
//  RestaurantInfoRouter.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/23.
//

import Foundation
import Moya

enum RestaurantInfoRouter {
    case getRestaurantInfoResponse(restaurantName: String)
}

extension RestaurantInfoRouter: TargetType {
    var baseURL: URL {
        return URL (string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .getRestaurantInfoResponse(let restaurantName):
            return "/restaurants/\(restaurantName)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getRestaurantInfoResponse:
            return .get
        }
    }

    var task: Task {
        switch self {
            case .getRestaurantInfoResponse(let restaurantName):
            return .requestParameters(parameters: ["restaurantName": restaurantName], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }
}

