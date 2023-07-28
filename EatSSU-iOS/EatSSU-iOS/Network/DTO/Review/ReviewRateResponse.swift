//
//  ReviewRateResponse.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/07/29.
//

import Foundation

struct ReviewRateResponse: Codable {
    let menuName: [String]
    let totalReviewCount: Int
    let mainGrade: Double
    let amountGrade: Double
    let tasteGrade: Double
    let reviewGradeCnt: StarCount
}

struct StarCount: Codable {
    let fiveCnt: Int
    let fourCnt: Int
    let threeCnt: Int
    let twoCnt: Int
    let oneCnt: Int
}

