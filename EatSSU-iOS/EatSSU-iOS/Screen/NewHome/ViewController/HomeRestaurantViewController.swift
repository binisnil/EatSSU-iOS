//
//  HomeRestaurantViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/08.
//

import UIKit

import Moya
import SnapKit
import Then

class HomeRestaurantViewController: BaseViewController {
    
    //MARK: - Properties
    
    let tabBarHeight: CGFloat = 50
    
    //MARK: - UI Components
    
    private let contentView = UIView()
    let restaurantView = HomeRestaurantView()
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonEvent()
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(restaurantView)
    }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(tabBarHeight)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }

        restaurantView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

