//
//  HomeRestaurantView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/08.
//

import UIKit

import Moya
import SnapKit
import Then

class HomeRestaurantView: BaseUIView {
    
    //MARK: - Properties

  
    // MARK: - UI Components
    
    // dormitory
    // dodam
    // student
    // foodcourt
    // snackcorner
    // thekitchen
   
    lazy var restaurantTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.separatorStyle = .none
    }
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .background
//        restaurantTableView.backgroundColor = .yellow
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(restaurantTableView)
    }
    
    override func setLayout() {
        restaurantTableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(47)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }

}

