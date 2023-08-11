//
//  MenuTypeInfo.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/11.
//

import Foundation

enum MenuTypeInfo {
    case change(ChangeMenuInfoData)
    case fix(FixedMenuInfoData)
    
    var menuData: MenuType {
        switch self {
        case .change(let menuData):
            return menuData
        case .fix(let menuData):
            return menuData
        }
    }
}
