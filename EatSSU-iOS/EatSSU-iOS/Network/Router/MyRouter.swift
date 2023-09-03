//
//  MyRouter.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/08/07.
//

import UIKit

import Moya

enum MyRouter {
    case myReview
    case myInfo
}

extension MyRouter: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .myReview:
            return "/mypage/myreview"
        case .myInfo:
            return "/mypage/info"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .myReview:
            return .get
        case .myInfo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .myReview:
            return .requestParameters(parameters: ["page": 0,
                                                   "size": 20,
                                                   "sort" : "date,DESC"
                                                  ],
                                      encoding: URLEncoding.queryString
            )
        case .myInfo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            let realm = RealmService()
            let token = realm.getToken()
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
