//
//  LunchView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/29.
//

import UIKit

import Moya
import SnapKit
import Then

class LunchView: BaseUIView {
    
    //MARK: - Properties
    
    let lunchMenuProvider = MoyaProvider<HomeRouter>()
    var fixedMenuTableListDict = [Int: [MenuInfoList]]()
    var dailyMenuTableListDict = [Int: [MenuInfoList]]()
    let fixedMenuRestaurants: [String] = ["FOOD_COURT", "SNACK_CORNER", "THE_KITCHEN"] // 고정메뉴 레스토랑
    let restaurantTags: [String: Int] = [
        "DOMITORY": 1,
        "DODAM": 2,
        "HAKSIK": 3,
        "FOOD_COURT": 4,
        "SNACK_CORNER": 5,
        "THE_KITCHEN": 6
    ]
  

    // MARK: - UI Components
    
    private let contentView = UIView()

    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    // dormitory
    let dormitoryCoordinateButton = UIButton().then {
        $0.setImage(UIImage(named: "coordinate"), for: .normal)
    }

    private let dormitoryLabel = UILabel().then {
        $0.text = "기숙사 식당"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
        
    lazy var dormitoryTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dormitoryCoordinateButton, dormitoryLabel])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 3.0
        return stackView
    }()
    
    lazy var dormitoryTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }
    
    lazy var dormitoryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dormitoryTitleStackView, dormitoryTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    // dodam
    private let dodamCoordinateButton = UIButton().then {
        $0.setImage(UIImage(named: "coordinate"), for: .normal)
    }
    
    private let dodamLabel = UILabel().then {
        $0.text = "도담 식당"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
        
    lazy var dodamTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dodamCoordinateButton, dodamLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var dodamTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }
    
    lazy var dodamStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dodamTitleStackView, dodamTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    // student
    private let studentCoordinateButton = UIButton().then {
        $0.setImage(UIImage(named: "coordinate"), for: .normal)
    }
    
    private let studentLabel = UILabel().then {
        $0.text = "학생 식당"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
        
    lazy var studentTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [studentCoordinateButton, studentLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var studentTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }
    
    lazy var studentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [studentTitleStackView, studentTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()

    
    // foodcourt
    private let foodCourtCoordinateButton = UIButton().then {
        $0.setImage(UIImage(named: "coordinate"), for: .normal)
    }
    
    private let foodCourtLabel = UILabel().then {
        $0.text = "푸드 코트"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
        
    lazy var foodCourtTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [foodCourtCoordinateButton, foodCourtLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var foodCourtTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }
    
    lazy var foodCourtStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [foodCourtTitleStackView, foodCourtTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    // snackcorner
    private let snackCornerCoordinateButton = UIButton().then {
        $0.setImage(UIImage(named: "coordinate"), for: .normal)
    }
    
    private let snackCornerLabel = UILabel().then {
        $0.text = "스낵 코너"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
        
    lazy var snackCornerTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [snackCornerCoordinateButton, snackCornerLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var snackCornerTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }
    
    lazy var snackCornerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [snackCornerTitleStackView, snackCornerTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    // thekitchen
    private let theKitchenCoordinateButton = UIButton().then {
        $0.setImage(UIImage(named: "coordinate"), for: .normal)
    }
    
    private let theKitchenLabel = UILabel().then {
        $0.text = "더 키친"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
        
    lazy var theKitchenTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [theKitchenCoordinateButton, theKitchenLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var theKitchenTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }
    
    lazy var theKitchenStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [theKitchenTitleStackView, theKitchenTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    lazy var allRestaurantStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dormitoryStackView,
                                                       dodamStackView,
                                                       studentStackView,
                                                       foodCourtStackView,
                                                       snackCornerStackView,
                                                       theKitchenStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20.0
        return stackView
    }()
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setTableViewTagNumber()
        setupTableView()
        getMenuTableView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(allRestaurantStackView)
    }
    
    override func setLayout() {
        
        [dormitoryTableView, dodamTableView, studentTableView, foodCourtTableView, snackCornerTableView, theKitchenTableView].forEach { $0.snp.makeConstraints {
                $0.width.equalTo(355)
//            $0.centerX.equalToSuperview()
            }
        }
        
        allRestaurantStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
//        [dormitoryStackView,dodamStackView,studentStackView,foodCourtStackView,snackCornerStackView,theKitchenStackView].forEach {
//            $0.snp.makeConstraints {
//                $0.horizontalEdges.equalToSuperview().inset(16)
//                            $0.centerX.equalToSuperview()
//            }
//        }
    }
    
    func setTableViewTagNumber() {
        dormitoryTableView.tag = 1
        dodamTableView.tag = 2
        studentTableView.tag = 3
        foodCourtTableView.tag = 4
        snackCornerTableView.tag = 5
        theKitchenTableView.tag = 6
    }
    
    func getMenuTableView() {
        getDailyLunchMenuTable(date: "20230530", restaurant: "DODAM", tableView: dodamTableView)

        getFixedLunchMenuTable(restaurant: "FOOD_COURT", tableView: foodCourtTableView)
        getFixedLunchMenuTable(restaurant: "SNACK_CORNER", tableView: snackCornerTableView)
        getFixedLunchMenuTable(restaurant: "THE_KITCHEN", tableView: theKitchenTableView)
    }
    
    func setupTableView() {
        [dormitoryTableView, dodamTableView, studentTableView, foodCourtTableView, snackCornerTableView, theKitchenTableView].forEach {
            $0.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            
            $0.layer.borderColor = UIColor.barGray.cgColor
            $0.layer.borderWidth = 1.0
        }
    }
    
    func restaurantNameForTag(_ tag: Int) -> String? {
        for (key, value) in restaurantTags {
            if value == tag {
                return key
            }
        }
        return nil
    }
}

extension LunchView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag > 3 {
            if let menuTableList = fixedMenuTableListDict[tableView.tag] {
                return menuTableList.count
            }
        } else {
            return dailyMenuTableListDict.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell ?? MenuTableViewCell()
        
        if let restaurantName = restaurantNameForTag(tableView.tag) {
            if fixedMenuRestaurants.contains(restaurantName) {
                if let menuTableList = fixedMenuTableListDict[tableView.tag] {
                    let cellMenu: MenuInfoList = menuTableList[indexPath.row]
                    
                    cell.nameLabel.text = cellMenu.name
                    cell.priceLabel.text = "\(cellMenu.price)"
                    cell.ratingLabel.text = "\(cellMenu.grade ?? 0)"
                }
            }else{
                if tableView.tag == 2 {
                    if let menuTableList = dailyMenuTableListDict[indexPath.row + 1] {// Non-fixed menus
                        let cellMenuList: [MenuInfoList] = menuTableList
                        
                        cell.nameLabel.text = cellMenuList.map { $0.name }.joined(separator: "+")
                        cell.priceLabel.text = "\(cellMenuList[0].price)"
                        cell.ratingLabel.text = "\(cellMenuList[0].grade ?? 0)"
                    }
                }
            }
            cell.textLabel?.font = .regular(size: 14)
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            cell.selectionStyle = .none     // 셀 선택 비활성화
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MenuHeaderView()
        return header
    }
}

extension LunchView: UITableViewDelegate {}

extension LunchView: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        //크기 변경 됐을 경우
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}

// MARK: - Network

extension LunchView {
    
    func getFixedLunchMenuTable(restaurant: String, tableView: UITableView) {
        self.lunchMenuProvider.request(.getFixedRestaurantMenu(restaurant: restaurant)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseDetailDto = try moyaResponse.map(FixedMenuTableResponse.self)
                    self.fixedMenuTableListDict[tableView.tag] = responseDetailDto.menuInfoList
                    tableView.reloadData()
                    print(responseDetailDto)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    func getDailyLunchMenuTable(date: String, restaurant: String, tableView: UITableView) {
        self.lunchMenuProvider.request(.getDailyLunchRestaurantMenu(date: date, restaurant: restaurant)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseDetailDto = try moyaResponse.map([DailyMenuTableResponse].self)
                                    
                    for menuTable in responseDetailDto {
                        self.dailyMenuTableListDict[menuTable.flag] = menuTable.dailyMenuInfoList
                    }
                    DispatchQueue.main.async {
                        tableView.reloadData()
                    }
                    print("responseDetailDto: \(responseDetailDto)")
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

