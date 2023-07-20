//
//  ChangeMenuTableResponse.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/19.
//

import Foundation

struct ChangeMenuTableResponse: Codable {
    let mealId: Int
    let price: Int
    let mainGrade: Double?
    let changeMenuInfoList: [ChangeMenuInfo]
}

struct ChangeMenuInfo: Codable {
    let menuId: Int
    let name: String
}
