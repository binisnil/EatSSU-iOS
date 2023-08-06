//
//  UserNicknameRouter.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/01.
//
import Foundation

import Moya

enum UserNicknameRouter {
    case setNickname(nickname: String)
}

extension UserNicknameRouter: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String{
        switch self {
        case .setNickname:
            return "/user/nickname"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .setNickname:
            return .patch
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .setNickname(let nickname):
            let param: [String : String] = ["nickname" : nickname]
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
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
