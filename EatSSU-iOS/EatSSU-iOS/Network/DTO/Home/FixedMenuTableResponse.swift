//
//  MenuTableResponse.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/27.
//

import Foundation

struct FixedMenuTableResponse: Codable {
    let fixMenuInfoList: [FixedMenuInfo]
}

struct FixedMenuInfo: Codable {
    let menuId: Int
    let name: String
    let mainGrade: Double
    let price: Int
}
