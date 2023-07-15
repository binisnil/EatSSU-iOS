//
//  RestaurantInfoModel.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit

import SnapKit
import Then

struct RestaurantInfoModel: AppData {
    let location: String
    let openHours: [OpenHours]
}

struct OpenHours: AppData {
    let dayType: String
    let timePart: String
    let time: String
}

extension RestaurantInfoModel {
    
    static func dummy() -> [RestaurantInfoModel] {
        return [RestaurantInfoModel(location: "기숙사 1층", openHours: [OpenHours(dayType: "주중 / 주말, 공휴일", timePart: "아침/점심/저녁", time: "11:00 - 14:00")])]
    }
}         
