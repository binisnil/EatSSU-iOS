//
//  HomeRestaurantTableHeaderView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/09.
//

import UIKit

import SnapKit

class HomeRestaurantTableHeaderView: BaseUIView {
    
    let restaurantTitleButton = UIButton().then {
        $0.titleLabel?.font = .bold(size: 18)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setImage(ImageLiteral.coordinate, for: .normal)
//        $0.configuration?.imagePadding = 7
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
}
