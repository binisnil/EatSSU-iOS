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
    case reviewRate(_ type: String, _ id: Int)
    case reviewList(_ type: String, _ id: Int)
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
        case .reviewRate:
            return "/review/info"
        case .reviewList:
            return "/review/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .totalReview, .menuReview:
            return .get
        case .reviewRate:
            return .get
        case .reviewList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case.totalReview:
            return .requestPlain
        case .menuReview:
            return .requestPlain
        case .reviewRate(let type, let id):
            switch type {
            case "CHANGE":
                return .requestParameters(parameters: ["menuType": type,
                                                       "mealId": id], encoding: URLEncoding.queryString)
            case "FIX":
                return .requestParameters(parameters: ["menuType": type,
                                                       "menuId": id], encoding: URLEncoding.queryString)
            default:
                return .requestPlain
            }
            
            /// 이후 정렬 순서, 리뷰 로드 개수 등 수정 필요하면 고치기
        case .reviewList(let type, let id):
            switch type {
            case "CHANGE":
                return .requestParameters(parameters: ["menuType": type,
                                                       "mealId": id,
                                                       "page": 0,
                                                       "size": 20,
                                                       "sort": "date,DESC"], encoding: URLEncoding.queryString)
            case "FIX":
                return .requestParameters(parameters: ["menuType": type,
                                                       "menuId": id,
                                                       "page": 0,
                                                       "size": 20,
                                                       "sort": "date,DESC"], encoding: URLEncoding.queryString)
            default:
                return .requestPlain
            }
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type":"application/json"]
        }
    }
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        default:
            return .bearer
        }
    }
}
