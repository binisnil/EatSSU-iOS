//
//  MorningViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import Moya
import SnapKit
import Then

class MorningViewController: BaseViewController {
    
    //MARK: - Properties
    
    let morningTableProvider = MoyaProvider<HomeRouter>()
    let tabBarHeight: CGFloat = 50
    
    //MARK: - UI Components
    
    private let contentView = UIView()
    let morningView = HomeRestaurantView()
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
        contentView.addSubviews(morningView)
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

        morningView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func morningMenuAPI(date: String) {
        morningView.getChangeMenuTableResponse(date: date, restaurant: "DOMITORY", time: "MORNING")
        morningView.getChangeMenuTableResponse(date: date, restaurant: "DODAM", time: "MORNING")
        morningView.getChangeMenuTableResponse(date: date, restaurant: "HAKSIK", time: "MORNING")
    }
}
