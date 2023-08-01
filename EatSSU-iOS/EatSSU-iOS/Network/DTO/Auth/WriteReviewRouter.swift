//
//  WriteReviewRouter.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/05/30.
//

import UIKit

import Moya

enum WriteReviewRouter {
    case writeReview(param: WriteReviewRequest, image: [UIImage?], menuId: Int)
}

extension WriteReviewRouter: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .writeReview(param: _, image: _, menuId: let menuId):
            return "/review/\(menuId)"
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
        case .writeReview(param: let param, image: let imageList ,menuId: _):
            let jsonData: Data
            var multipartFileList: [MultipartFormData] = []
            do {
                jsonData = try JSONEncoder().encode(param)
                let formData = MultipartFormData(provider: .data(jsonData), name: "reviewCreate", mimeType: "application/json")
                multipartFileList.append(formData)
            } catch {
                print("Error encoding ReviewRequest: \(error)")
                return .requestPlain
            }
            
            if imageList.count != 0 {
                for fileData in imageList {
                    let imageData = fileData?.jpegData(compressionQuality: 0.5) ?? Data()
                    let formData = MultipartFormData(provider: .data(imageData), name: "multipartFileList", fileName: "image.jpg", mimeType: "image/jpeg")
                    multipartFileList.append(formData)
                }
            }
            return .uploadMultipart(multipartFileList)
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
