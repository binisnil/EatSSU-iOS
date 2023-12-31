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
    case report(param: ReportRequest)
    case deleteReview(_ reviewId: Int)
    case fixReview(_ reviewId: Int, _ param: WriteReviewRequest)
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
        case .report:
            return "/report/"
        case .deleteReview(let reviewId):
            return "/review/\(reviewId)"
        case .fixReview(let reviewId, _):
            return "/review/\(reviewId)"
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
        case .report:
            return .post
        case .deleteReview:
            return .delete
        case .fixReview:
            return .patch
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
                                                       "sort": "date,DESC"],
                                          encoding: URLEncoding.queryString)
            case "FIX":
                return .requestParameters(parameters: ["menuType": type,
                                                       "menuId": id,
                                                       "page": 0,
                                                       "size": 20,
                                                       "sort": "date,DESC"],
                                          encoding: URLEncoding.queryString)
            default:
                return .requestPlain
            }
        case .report(param: let param):
            return .requestJSONEncodable(param)
        case .deleteReview:
            return .requestPlain
        case .fixReview(_, let param):
            return .requestJSONEncodable(param)
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
