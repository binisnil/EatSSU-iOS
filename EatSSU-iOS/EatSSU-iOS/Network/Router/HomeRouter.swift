//
//  HomeRouter.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/27.
//

import Foundation
import Moya

enum HomeRouter {
    case getFixedRestaurantMenu(restaurant: String)
    case getDailyMorningRestaurantMenu(date: String, restaurant: String)
    case getDailyLunchRestaurantMenu(date: String, restaurant: String)
    case getDailyDinnerRestaurantMenu(date: String, restaurant: String)
    
}

extension HomeRouter: TargetType {
    var baseURL: URL {
        return URL (string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .getFixedRestaurantMenu:
            return "/menu"
        case .getDailyMorningRestaurantMenu(let date, _):
            return "/menu/\(date)/morning"
        case .getDailyLunchRestaurantMenu(let date, _):
            return "/menu/\(date)/lunch2"
        case .getDailyDinnerRestaurantMenu(let date, _):
            return "/menu/\(date)/dinner"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getFixedRestaurantMenu:
            return .get
        case .getDailyMorningRestaurantMenu:
            return .get
        case .getDailyLunchRestaurantMenu:
            return .get
        case .getDailyDinnerRestaurantMenu:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getFixedRestaurantMenu(let restaurant):
            return .requestParameters(parameters: ["restaurant": restaurant], encoding: URLEncoding.queryString)
        case .getDailyMorningRestaurantMenu(_, let restaurant):
            return .requestParameters(parameters: ["restaurant": restaurant], encoding: URLEncoding.queryString)
        case .getDailyLunchRestaurantMenu(_, let restaurant):
            return .requestParameters(parameters: ["restaurant": restaurant], encoding: URLEncoding.queryString)
        case .getDailyDinnerRestaurantMenu(_, let restaurant):
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
