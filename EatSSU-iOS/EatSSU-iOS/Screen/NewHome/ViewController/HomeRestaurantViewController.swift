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
    
    private let restaurantTableViewMenuTitleCellCount = 1
    private let headerHeight: CGFloat = 35
    
    private let changeDummy = ChangeMenuInfoData.Dummy()
    private let fixedDummy = FixedMenuInfoData.Dummy()
    private let sectionHeaderRestaurant = [TextLiteral.dormitoryRestaurant, 
                                           TextLiteral.dodamRestaurant, 
                                           TextLiteral.studentRestaurant, 
                                           TextLiteral.foodCourt, 
                                           TextLiteral.snackCorner, 
                                           TextLiteral.theKitchen]
    var currentRestaurant = ""
    var changeMenuTableViewData: [String: [ChangeMenuTableResponse]] = [:] {
        didSet {
            if let sectionIndex = getSectionIndex(for: currentRestaurant) {
                restaurantView.restaurantTableView.reloadSections([sectionIndex], with: .automatic)
                print("changeMenuTableViewData reloadSection: \(sectionIndex)")
            }
        }
    }
    
    let menuProvider = MoyaProvider<HomeRouter>(plugins: [MoyaLoggingPlugin()])
    
    //MARK: - UI Components
    
    let restaurantView = HomeRestaurantView()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setTableView()
        getChageMenuData(date: "20230714", restaurant: "DOMITORY", time: "LUNCH")
        getChageMenuData(date: "20230714", restaurant: "DODAM", time: "LUNCH")
        getChageMenuData(date: "20230714", restaurant: "HAKSIK", time: "LUNCH")

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
    
    func setTableView() {
        restaurantView.restaurantTableView.register(RestaurantTableViewMenuTitleCell.self,
                                                    forCellReuseIdentifier: RestaurantTableViewMenuTitleCell.identifier)
        restaurantView.restaurantTableView.register(RestaurantTableViewMenuCell.self,
                                                    forCellReuseIdentifier: RestaurantTableViewMenuCell.identifier)
        restaurantView.restaurantTableView.register(RestaurantTableViewHeader.self,
                                                    forHeaderFooterViewReuseIdentifier: "HomeRestaurantTableViewHeader")
    }
    
    func getSectionIndex(for restaurant: String) -> Int? {
        let restaurantRawValue = [TextLiteral.dormitoryRawValue,
                                  TextLiteral.dodamRawValue,
                                  TextLiteral.studentRestaurantRawValue,
                                  TextLiteral.foodCourtRawValue,
                                  TextLiteral.snackCornerRawValue,
                                  TextLiteral.theKitchenRawValue]
        print("getSectionRRRRRRR: \(restaurant)")
        print("getSectionIndex: \(restaurantRawValue.firstIndex(of: restaurant))")
        return restaurantRawValue.firstIndex(of: restaurant)
    }

}

extension HomeRestaurantViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaderRestaurant.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if [0, 1, 2].contains(section) {
            print("numberOfRowsInSection: \((changeMenuTableViewData[currentRestaurant]?.count ?? 0)  + restaurantTableViewMenuTitleCellCount)")
            return (changeMenuTableViewData[currentRestaurant]?.count ?? 0)  + restaurantTableViewMenuTitleCellCount
        } else if [3, 4, 5].contains(section) {
            return fixedDummy.count + restaurantTableViewMenuTitleCellCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Menu Title Cell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewMenuTitleCell.identifier, for: indexPath)
            return cell
            /// Menu Cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewMenuCell.identifier, for: indexPath) as! RestaurantTableViewMenuCell
            if [0, 1, 2].contains(indexPath.section) {
                //                cell.model = .change(changeDummy[indexPath.row-restaurantTableViewMenuTitleCellCount])
                if let data = changeMenuTableViewData[currentRestaurant]?[indexPath.row - restaurantTableViewMenuTitleCellCount] {
                    cell.model = .change(data)
                    //                cell.model = .change(changeMenuTableViewData[currentRestaurant]?[indexPath.row - restaurantTableViewMenuTitleCellCount])
                }
            } else if [3, 4, 5].contains(indexPath.section) {
                //                cell.model = .fix(fixedDummy[indexPath.row-restaurantTableViewMenuTitleCellCount])
                if let data = changeMenuTableViewData[currentRestaurant]?[indexPath.row - restaurantTableViewMenuTitleCellCount] {
                    cell.model = .change(data)
                }
                
                return cell
            }
        }
        return RestaurantTableViewMenuCell()
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let homeRestaurantTableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeRestaurantTableViewHeader") as? RestaurantTableViewHeader else {
            return nil
        }
        /// section header 타이틀 속성 지정
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
        return headerHeight
    }
}
    
// MARK: - Network

extension HomeRestaurantViewController {
    
    func getChageMenuData(date: String, restaurant: String, time: String) {
        self.menuProvider.request(.getChangeMenuTableResponse(date: date, restaurant: restaurant, time: time)) { response in
            switch response {
            case .success(let responseData):
                do {
                    self.currentRestaurant = restaurant
                    let responseDetailDto = try responseData.map([ChangeMenuTableResponse].self)
                    self.changeMenuTableViewData = [restaurant: responseDetailDto]
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
}

