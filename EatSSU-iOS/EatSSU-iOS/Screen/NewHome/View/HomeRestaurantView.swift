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
    
    /// dormitory
    /// dodam
    /// student
    /// foodcourt
    /// snackcorner
    /// thekitchen
   
    lazy var restaurantTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.separatorStyle = .none
        $0.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .background
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(restaurantTableView)
    }
    
    override func setLayout() {
        restaurantTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }

}
