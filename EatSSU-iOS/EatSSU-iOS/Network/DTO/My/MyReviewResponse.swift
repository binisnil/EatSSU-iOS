//
//  MyReviewResponse.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/08/07.
//

import Foundation

// MARK: - MyReviewResponse

struct MyReviewResponse: Codable {
    let numberOfElements: Int
    let hasNext: Bool
    let dataList: [MyDataList]
}

// MARK: - DataList
struct MyDataList: Codable {
    let reviewID, mainGrade, amountGrade, tasteGrade: Int
    let writeDate, menuName, content: String
    let imgURLList: [String]

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case mainGrade, amountGrade, tasteGrade, writeDate, menuName, content
        case imgURLList = "imgUrlList"
    }
}
