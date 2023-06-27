//
//  WriteReviewRouter.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/05/30.
//

import UIKit

import Moya

enum WriteReviewRouter {
    case writeReview(param: WriteReviewRequest, menuId: Int)
}

extension WriteReviewRouter: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .writeReview(param: _, menuId: let menuId):
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
        case.writeReview(param: let param, menuId: _):
            var multipartFormDatas: [MultipartFormData] = []
            if param.multipartFileList != nil {
                
            multipartFormDatas.append(MultipartFormData(provider: .data("\(param.reviewCreate.grade)".data(using: .utf8) ?? Data()),
                                                        name: "grade",
                                                        mimeType: "application/json"))
            for reviewTags in param.reviewCreate.reviewTags {
                multipartFormDatas.append(MultipartFormData(provider: .data(reviewTags.data(using: .utf8) ?? Data()),
                                                            name: "reviewTags",
                                                            mimeType: "application/json"))
            }
            multipartFormDatas.append(MultipartFormData(provider: .data("\(param.reviewCreate.content)".data(using: .utf8) ?? Data()),
                                                        name: "content",
                                                        mimeType: "application/json"))
            
            if let multipartFileList = param.multipartFileList {
                for image in multipartFileList {
                        multipartFormDatas.append(MultipartFormData(provider: .data(image),
                                                                    name: "multipartFileList",
                                                                    fileName: "userImage.jpeg",
                                                                    mimeType: "image/jpeg"))
                    }
            }
                return .uploadMultipart(multipartFormDatas)
        } else {
                return .requestJSONEncodable(param)
            }
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .writeReview(param: let param, menuId: _):
            if param.multipartFileList == nil {
                let realm = RealmService()
                let token = realm.getToken()
                return ["Content-Type":"multipart/form-data",
                        "Authorization": "Bearer \(token)"]
            } else {
                let realm = RealmService()
                let token = realm.getToken()
                return ["Content-Type":"application/json",
                        "Authorization": "Bearer \(token)"]
            }
//        default:
//            let realm = RealmService()
//            let token = realm.getToken()
//            return ["Content-Type":"multipart/form-data",
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

