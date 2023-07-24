//
//  RestaurantInfoViewController.swift.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/10.
//

import UIKit

import MapKit
import Moya
import SnapKit
import Then

class RestaurantInfoViewController: BaseViewController {
    
    // MARK: - Properties
    
    let restaurantInfoProvider = MoyaProvider<RestaurantInfoRouter>()

    // MARK: - UI Components
    
    private let restaurantInfoView = RestaurantInfoView()

    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 업데이트 된 높이 제약 조건을 사용하여 테이블 뷰 높이 제약 조건 설정
//        tableViewHeightConstraint.constant = restaurantInfoView.weekdayTimeTableView.contentSize.height
//        restaurantInfoView.weekdayTimeTableView.layoutIfNeeded()
    }

    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(restaurantInfoView)
    }
    
    override func setLayout() {
        restaurantInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - RestaurantInfoDelegate

extension RestaurantInfoViewController: RestaurantInfoDelegate {
    func didTappedRestaurantInfo(restaurantName: String) {
        restaurantInfoView.restaurantNameLabel.text = restaurantName
    }
}

// MARK: - Network

extension RestaurantInfoViewController {
     
    func getRestaurantInfoResponse(restaurantName: String) {
        self.restaurantInfoProvider.request(.getRestaurantInfoResponse(restaurantName: restaurantName)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    
                    let responseDate = try moyaResponse.map(RestaurantInfoResponse.self)
                    self.restaurantInfoView.restaurantInfoInputData = responseDate
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
