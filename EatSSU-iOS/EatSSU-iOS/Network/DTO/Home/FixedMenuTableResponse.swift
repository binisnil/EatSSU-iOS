//
//  MenuTableResponse.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/27.
//

import Foundation

struct FixedMenuTableResponse: Codable {
    let menuInfoList: [MenuInfoList]?
}

struct MenuInfoList: Codable {
    let menuId: Int
    let name: String
    let price: Int
    let grade: Double
}


