//
//  MyPageModel.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/25.
//

import Foundation

struct MyPageLocalData: AppData {
    let titleLabel: String
}

extension MyPageLocalData {
    static let myPageServiceLabelList = [MyPageLocalData(titleLabel: TextLiteral.myReview),
                                         MyPageLocalData(titleLabel: TextLiteral.logout),
                                         MyPageLocalData(titleLabel: TextLiteral.withdraw),
                                         MyPageLocalData(titleLabel: TextLiteral.appVersion)]
}

struct MyPageRightItemData: AppData {
    let rightArrow: String
    let appVersion: String
}

extension MyPageRightItemData {
    static let myPageRightItemList = [MyPageRightItemData(rightArrow: ">", appVersion: "1.0.0")]
}
