//
//  ChangeMenuInfoModel.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import Foundation

struct ChangeMenuInfoData: MenuType {
    let mealId: Int
    let price: Int
    let mainGrage: Double
    let changeMenuInfoList: [ChangeMenuInfo]
}

extension ChangeMenuInfoData {
    static func Dummy() -> [ChangeMenuInfoData] {
        return [
            ChangeMenuInfoData(mealId: 1, price: 6000, mainGrage: 4.0, changeMenuInfoList: [.init(menuId: 63, name: "요플레"),
                                                                                            .init(menuId: 64, name: "깻잎지무침"),
                                                                                            .init(menuId: 65, name: "와사비무쌈"),
                                                                                            .init(menuId: 66, name: "김구이"),
                                                                                            .init(menuId: 67, name: "잡곡밥"),
                                                                                            .init(menuId: 68, name: "얼큰어묵국"),
                                                                                            .init(menuId: 69, name: "깍두기"),
                                                                                            .init(menuId: 70, name: "야쿠르트")
            ]),
            ChangeMenuInfoData(mealId: 2, price: 8000, mainGrage: 0, changeMenuInfoList: [.init(menuId: 71, name: "매콤소불고기"),
                                                                                          .init(menuId: 72, name: "감자고로케"),
                                                                                          .init(menuId: 73, name: "양배추찜"),
                                                                                          .init(menuId: 67, name: "잡곡밥"),
                                                                                          .init(menuId: 74, name: "호박된장찌개"),
                                                                                          .init(menuId: 69, name: "깍두기"),
                                                                                          .init(menuId: 70, name: "야쿠르트")])]
    }
}
