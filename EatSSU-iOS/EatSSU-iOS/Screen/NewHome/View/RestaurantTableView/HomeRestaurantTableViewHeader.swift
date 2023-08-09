//
//  HomeRestaurantTableViewHeader.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/09.
//

import UIKit

import SnapKit

class HomeRestaurantTableViewHeader: BaseTableViewHeaderView {
    
    let restaurantTitleButton = UIButton().then {
        $0.addTitleAttribute(title: "기숙사 식당", titleColor: .black, fontName: .bold(size: 18))
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setImage(ImageLiteral.coordinate, for: .normal)
//        $0.configuration?.imagePadding = 7
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
    
    //MARK: - Functions
    
    override func configure() {
        super.configure()
        
        configureUI()
        setLayout()
    }
        
    func configureUI() {
        contentView.addSubview(restaurantTitleButton)
    }
    
    func setLayout() {
        restaurantTitleButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
    }
}
