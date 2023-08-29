//
//  RestaurantInfoViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/29.
//

import SnapKit

class RestaurantInfoViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let restaurantInfoView = RestaurantInfoView()
    
    // MARK: - Functions
    
    override func configureUI() {
        view.addSubview(restaurantInfoView)
    }
    
    override func setLayout() {
        restaurantInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


