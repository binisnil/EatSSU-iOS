//
//  ReviewListResponse.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/08/01.
//

import Foundation

struct ReviewListResponse: Codable {
    let numberOfElements: Int
    let hasNext: Bool
    let dataList: [MenuDataList]
}

// MARK: - DataList
struct MenuDataList: Codable {
    let reviewID: Int
    let menu: String
    let writerID: Int
    let isWriter: Bool
    let writerNickname: String
    let mainGrade, amountGrade, tasteGrade: Int
    let writeDate, content: String
    let imgURLList: [String]

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case menu
        case writerID = "writerId"
        case isWriter, writerNickname, mainGrade, amountGrade, tasteGrade, writeDate, content
        case imgURLList = "imgUrlList"
    }
}
