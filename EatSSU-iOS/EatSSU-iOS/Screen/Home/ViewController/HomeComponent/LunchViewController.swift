//
//  LunchViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import SnapKit
import Moya

class LunchViewController: BaseViewController {
    
    //MARK: - Properties
    
    let morningTableProvider = MoyaProvider<HomeRouter>()
    let tabBarHeight: CGFloat = 50
    
    //MARK: - UI Components
    
    private let contentView = UIView()
    let lunchView = HomeRestaurantView()
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonEvent()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fixedMenuAPI()
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(lunchView)
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
        lunchView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }

    func lunchMenuAPI(date: String) {
        lunchView.getChangeMenuTableResponse(date: date, restaurant: "DOMITORY", time: "LUNCH")
        lunchView.getChangeMenuTableResponse(date: date, restaurant: "DODAM", time: "LUNCH")
        lunchView.getChangeMenuTableResponse(date: date, restaurant: "HAKSIK", time: "LUNCH")
    }
    
    func fixedMenuAPI() {
        lunchView.getFixedMenuTableResponse(restaurant: "FOOD_COURT")
        lunchView.getFixedMenuTableResponse(restaurant: "SNACK_CORNER")
        lunchView.getFixedMenuTableResponse(restaurant: "THE_KITCHEN")
    }
}

