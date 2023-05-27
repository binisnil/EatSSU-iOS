//
//  WriteReviewRequest.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/05/24.
//

import Foundation

struct WriteReviewRequest: Codable {
    let reviewCreate: ReviewContent
    let multipartFileList: [String]
}

struct ReviewContent: Codable {
    let grade: Int
    let reviewTags: [String]
    let content: String
}
