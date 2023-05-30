//
//  HomeRouter.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/27.
//

import Foundation

import Moya

enum HomeRouter {
    case morningMenuTable(menuId: Int)
}

extension HomeRouter: TargetType {
    var baseURL: URL {
        return URL (string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .morningMenuTable(let menuId):
            return "/menu/\(menuId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .morningMenuTable:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .morningMenuTable:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
}
