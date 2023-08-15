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

protocol ReviewMenuTypeInfoDelegate: AnyObject {
    func didDelegateReviewMenuTypeInfo(for menuTypeData: ReviewMenuTypeInfo)
}

class HomeRestaurantViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let restaurantTableViewMenuTitleCellCount = 1
    private let headerHeight: CGFloat = 35
    
    var delegate: ReviewMenuTypeInfoDelegate?
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
            }
        }
    }
    
    var fixMenuTableViewData: [String: FixedMenuTableResponse] = [:] {
        didSet {
            if let sectionIndex = getSectionIndex(for: currentRestaurant) {
                restaurantView.restaurantTableView.reloadSections([sectionIndex], with: .automatic)
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
        return restaurantRawValue.firstIndex(of: restaurant)
    }
    
    func getSectionKey(for section: Int) -> String {
        let restaurantRawValue = [TextLiteral.dormitoryRawValue,
                                  TextLiteral.dodamRawValue,
                                  TextLiteral.studentRestaurantRawValue,
                                  TextLiteral.foodCourtRawValue,
                                  TextLiteral.snackCornerRawValue,
                                  TextLiteral.theKitchenRawValue]
        return restaurantRawValue[section]
    }

    func fetchData(date: String, time: String) {
        print("🎒 \(time)")
        getChageMenuData(date: date, restaurant: "DOMITORY", time: time) {}
        getChageMenuData(date: date, restaurant: "DODAM", time: time) {}
        getChageMenuData(date: date, restaurant: "HAKSIK", time: time) {}
        getFixMenuData(restaurant: "FOOD_COURT") {}
        getFixMenuData(restaurant: "SNACK_CORNER") {}
        getFixMenuData(restaurant: "THE_KITCHEN") {}
        
//        restaurantView.restaurantTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension HomeRestaurantViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaderRestaurant.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = getSectionKey(for: section)
        
        if [0, 1, 2].contains(section) {
            return (changeMenuTableViewData[sectionKey]?.count ?? 0)  + restaurantTableViewMenuTitleCellCount
        } else if [3, 4, 5].contains(section) {
            return (fixMenuTableViewData[sectionKey]?.fixMenuInfoList.count ?? 0) + restaurantTableViewMenuTitleCellCount
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
            // MARK: 섹션지정
            if indexPath.section == 0 {
                if let data = changeMenuTableViewData[TextLiteral.dormitoryRawValue]?[indexPath.row - restaurantTableViewMenuTitleCellCount] {
                    cell.model = .change(data)
                }
            } else if indexPath.section == 1 {
                if let data = changeMenuTableViewData[TextLiteral.dodamRawValue]?[indexPath.row - restaurantTableViewMenuTitleCellCount] {
                    cell.model = .change(data)
                }
            } else if indexPath.section == 2 {
                if let data = changeMenuTableViewData[TextLiteral.studentRestaurantRawValue]?[indexPath.row - restaurantTableViewMenuTitleCellCount] {
                    cell.model = .change(data)
                }
            } else if indexPath.section == 3 {
                if let data = fixMenuTableViewData[TextLiteral.foodCourtRawValue]?.fixMenuInfoList[indexPath.row - restaurantTableViewMenuTitleCellCount] {
                    cell.model = .fix(data)
                }
            } else if indexPath.section == 4 {
                if let data = fixMenuTableViewData[TextLiteral.snackCornerRawValue]?.fixMenuInfoList[indexPath.row - restaurantTableViewMenuTitleCellCount] {
                    cell.model = .fix(data)
                }
            } else if indexPath.section == 5 {
                if let data = fixMenuTableViewData[TextLiteral.theKitchenRawValue]?.fixMenuInfoList[indexPath.row - restaurantTableViewMenuTitleCellCount] {
                    cell.model = .fix(data)
                }
            }
            return cell
        }
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
    
// MARK: - UITableViewDelegate

extension HomeRestaurantViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = getSectionKey(for: indexPath.section)
        /// bind Data
        var reviewMenuTypeInfo: ReviewMenuTypeInfo = ReviewMenuTypeInfo(menuType: "", menuID: 0)
        
        if [0, 1, 2].contains(indexPath.section) {
            reviewMenuTypeInfo.menuType = "CHANGE"
            reviewMenuTypeInfo.menuID = changeMenuTableViewData[restaurant]?[indexPath.row - restaurantTableViewMenuTitleCellCount].mealId ?? 100
        } else if [3, 4, 5].contains(indexPath.section) {
            reviewMenuTypeInfo.menuType = "FIX"
            reviewMenuTypeInfo.menuID = fixMenuTableViewData[restaurant]?.fixMenuInfoList[indexPath.row - restaurantTableViewMenuTitleCellCount].menuId ?? 100
        }
        
        /// push VC
        let reviewViewController = ReviewViewController()
        self.delegate = reviewViewController
        self.navigationController?.pushViewController(reviewViewController, animated: true)
        
        delegate?.didDelegateReviewMenuTypeInfo(for: reviewMenuTypeInfo)
    }
}
    
// MARK: - Network

extension HomeRestaurantViewController {
    
    func getChageMenuData(date: String, restaurant: String, time: String, completion: @escaping () -> Void) {
        self.menuProvider.request(.getChangeMenuTableResponse(date: date, restaurant: restaurant, time: time)) { response in
            switch response {
            case .success(let responseData):
                do {
                    self.currentRestaurant = restaurant
                    let responseDetailDto = try responseData.map([ChangeMenuTableResponse].self)
                    self.changeMenuTableViewData[restaurant] = responseDetailDto
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
            completion()
        }
    }
    
    func getFixMenuData(restaurant: String, completion: @escaping () -> Void) {
        self.menuProvider.request(.getFixedMenuTableResponse(restaurant: restaurant)) { response in
            switch response {
            case .success(let responseData):
                do {
                    self.currentRestaurant = restaurant
                    let responseDetailDto = try responseData.map(FixedMenuTableResponse.self)
                    self.fixMenuTableViewData[restaurant] = responseDetailDto
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
            completion()
        }
    }
}
