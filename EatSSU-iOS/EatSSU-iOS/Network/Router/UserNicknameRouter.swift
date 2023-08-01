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
//            let token = realm.getToken()
            let token = """
2023-08-01 19:25:22.576  8652-8796  okhttp.OkHttpClient     com.eatssu.android                   I  {"accessToken":"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJpZFwiOjEsXCJlbWFpbFwiOlwicWxkbHMwMzA3QG5hdmVyLmNvbVwifSIsImF1dGgiOiJST0xFX1VTRVIiLCJleHAiOjE2OTM0Nzc1MjV9.9ObUmDMj-e7vsfLh_qBgj8QFcWmyALl9TkyzSOGJ0r6nfT0SscJl-LbiomKYBsDWnuSfKQjz2DHzir3_SEoL3w","refreshToken":"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJpZFwiOjEsXCJlbWFpbFwiOlwicWxkbHMwMzA3QG5hdmVyLmNvbVwifSIsImF1dGgiOiJST0xFX1VTRVIiLCJleHAiOjE2OTE0OTAzMjV9.o_RePOtEqfzRHywz70q7Rq5JMK884d-e7NxBiEoHEmKimfNp40SIonIL7Cc4Rxp70k0KvbM1_EBfQqws46q3uw"}
"""
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
