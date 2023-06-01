//
//  WriteReviewRequest.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/05/24.
//

import Foundation
import UIKit

struct WriteReviewRequest: Codable {
    let reviewCreate: ReviewContent
    let multipartFileList: [Data]?
    
    init(reviewCreate: ReviewContent, multipartFileList: [Data]) {
        self.reviewCreate = reviewCreate
        self.multipartFileList = multipartFileList
    }
}

struct ReviewContent: Codable {
    let grade: Int
    let reviewTags: [String]
    let content: String
    
    init(grade: Int, reviewTags: [String], content: String) {
        self.grade = grade
        self.reviewTags = reviewTags
        self.content = content
    }
}
