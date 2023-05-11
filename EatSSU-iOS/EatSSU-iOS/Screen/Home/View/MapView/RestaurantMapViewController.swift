//
//  RestaurantMapViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/10.
//

import UIKit

import SnapKit
import Then

class RestaurantMapViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let restaurantNameLabel = UILabel().then {
        $0.text = "숭실 도담 식당"
        $0.font = .bold(size: 22)
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
   
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        //override Point
    }
    
    override func setLayout() {
        restaurantNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        //override Point
    }
    
}
