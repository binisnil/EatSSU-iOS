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
    
    let restaurantView = HomeRestaurantView()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        restaurantView.restaurantTableView.register(RestaurantTableViewMenuTitleCell.self, forCellReuseIdentifier: RestaurantTableViewMenuTitleCell.identifier)
        restaurantView.restaurantTableView.register(RestaurantTableViewMenuCell.self, forCellReuseIdentifier: RestaurantTableViewMenuCell.identifier)
        restaurantView.restaurantTableView.register(RestaurantTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "HomeRestaurantTableViewHeader")
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(restaurantView)
    }

    override func setLayout() {
        restaurantView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDelegate() {
        restaurantView.restaurantTableView.dataSource = self
        restaurantView.restaurantTableView.delegate = self
    }

}

extension HomeRestaurantViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewMenuTitleCell.identifier, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewMenuCell.identifier, for: indexPath)
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            // Header 영역 크기 = 140(separator 상단) + 12(separator 하단)
//
////            return section == 0 ? 152 : 0
//        return 100
//        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let homeRestaurantTableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeRestaurantTableViewHeader")
        return homeRestaurantTableViewHeader
    }
    
}

extension HomeRestaurantViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}
