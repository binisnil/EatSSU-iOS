//
//  WriteReviewRouter.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/05/30.
//

import Moya
import Foundation

enum WriteReviewRouter {
    case writeReview(_ menuId: Int)
}

extension WriteReviewRouter: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .writeReview(let menuId):
            return "/review/\(menuId)/detail"

        }
    }
    
    var method: Moya.Method {
        switch self {
        case .writeReview:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case.writeReview(let param):
            return .requestJSONEncodable(param)

        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            let realm = RealmService()
            let token = realm.getToken()
            return ["Content-Type":"multipart/form-data",
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

