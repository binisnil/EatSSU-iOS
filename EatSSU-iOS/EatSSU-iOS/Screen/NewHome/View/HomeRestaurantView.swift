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
    
//    let dormitoryCoordinateButton = UIButton().then {
//        $0.setImage(ImageLiteral.coordinate, for: .normal)
//        $0.addTitleAttribute(title: TextLiteral.dormitoryRestaurant, titleColor: .black, fontName: .bold(size: 20))
//        $0.titleLabel?.adjustsFontSizeToFitWidth = true
//        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
//        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
//    }
//
//    lazy var dormitoryTableView = MenuTableView()
//
//    lazy var dormitoryStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [dormitoryCoordinateButton, dormitoryTableView])
//        stackView.axis = .vertical
//        stackView.alignment = .leading
//        stackView.spacing = 10.0
//        return stackView
//    }()
    
    // dormitory
    // dodam
    // student
    // foodcourt
    // snackcorner
    // thekitchen
   
    lazy var restaurantTableView = UITableView(frame: .zero, style: .insetGrouped)
    
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

