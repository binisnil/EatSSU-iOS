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
    
    private let changeDummy = ChangeMenuInfoData.Dummy()
    private let fixedDummy = FixedMenuInfoData.Dummy()
    private let restaurantTableViewMenuTitleCellCount = 1
    private let sectionHeaderRestaurant = [TextLiteral.dormitoryRestaurant, 
                                           TextLiteral.dodamRestaurant, 
                                           TextLiteral.studentRestaurant, 
                                           TextLiteral.foodCourt, 
                                           TextLiteral.snackCorner, 
                                           TextLiteral.theKitchen]
    
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
        return sectionHeaderRestaurant.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sectionHeaderRestaurant[section]
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return changeDummy.count+restaurantTableViewMenuTitleCellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewMenuTitleCell.identifier, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewMenuCell.identifier, for: indexPath) as! RestaurantTableViewMenuCell
            cell.model = .change(changeDummy[indexPath.row-restaurantTableViewMenuTitleCellCount])
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
        guard let homeRestaurantTableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeRestaurantTableViewHeader") as? RestaurantTableViewHeader else {
                return nil
            }
        if let currentConfig = homeRestaurantTableViewHeader.restaurantTitleButton.configuration {
            var updatedConfig = currentConfig
            var titleAttr = AttributedString.init(sectionHeaderRestaurant[section])
            titleAttr.font = UIFont.bold(size: 18)
            titleAttr.foregroundColor = UIColor.black
            updatedConfig.attributedTitle = titleAttr

            homeRestaurantTableViewHeader.restaurantTitleButton.configuration = updatedConfig
        }
        return homeRestaurantTableViewHeader
    }
    
}

extension HomeRestaurantViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}