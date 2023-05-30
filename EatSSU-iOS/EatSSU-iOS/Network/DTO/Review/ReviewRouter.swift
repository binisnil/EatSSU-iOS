//
//  ReviewRouter.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/05/22.
//

import Moya
import Foundation

enum ReviewRouter {
    case totalReview(_ menuId: Int)
    case menuReview(_ menuId: Int)
//    case writeReview(_ menuId: Int)
}

extension ReviewRouter: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .totalReview(let menuId):
            return "/review/\(menuId)"
        case .menuReview(let menuId):
            return "/review/\(menuId)/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .totalReview, .menuReview:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case.totalReview:
            return .requestPlain
        case .menuReview:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
//            let realm = RealmService()
//            let token = realm.getToken()
            return ["Content-Type":"application/json"]
//                    "Authorization": "Bearer \(token)"]
        }
    }
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        default:
            return .bearer
        }
        
    }
}
