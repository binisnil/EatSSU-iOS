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
    static let myPageServiceLabelList = [MyPageLocalData(titleLabel: "내가 쓴 리뷰"),
                                         MyPageLocalData(titleLabel: "로그아웃"),
                                         MyPageLocalData(titleLabel: "탈퇴하기"),
                                         MyPageLocalData(titleLabel: "앱 버전")]
}

struct MyPageRightItemData: AppData {
    let rightArrow: String
    let appVersion: String
}

extension MyPageRightItemData {
    static let myPageRightItemDate = [MyPageRightItemData(rightArrow: ">", appVersion: "1.0.0")]
}
