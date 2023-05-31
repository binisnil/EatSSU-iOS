//
//  NonFixedMenuTableResponse.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/30.
//

import Foundation

struct DailyMenuTableResponse: Codable {
    let dailyMenuInfoList: [MenuInfoList]?
    let flag: Int
    
    enum CodingKeys: String, CodingKey {
            case dailyMenuInfoList = "menuInfoList"
            case flag
        }
}

struct MenuInfoList: Codable {
    let menuId: Int
    let name: String
    let price: Int
    let grade: Double?
}
