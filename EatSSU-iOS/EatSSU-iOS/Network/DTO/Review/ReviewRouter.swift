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
            let token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJpZFwiOjU3LFwiZW1haWxcIjpcInRlc3QxQG5hdmVyLmNvbVwifSIsImF1dGgiOiJST0xFX1VTRVIiLCJleHAiOjE2ODQ3NjE3ODR9.1iEVJTLAno6oUtkYOQF_X9wIPN0zaWLX9FkXe_KPgXdui7gvrsZ9x1_PfwE1vFpmbKLsmV2uKJrikm8T8bl2Iw"
            return ["Content-Type":"application/json",
                    "Authorization": "Bearer \(token)"]
        }
    }
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        default:
            return .bearer
        }
        
    }
}
