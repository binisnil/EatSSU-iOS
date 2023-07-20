//
//  LunchView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/29.
//H

import UIKit

import Moya
import SnapKit
import Then

class MorningView: BaseUIView {
    
    //MARK: - Properties
    
    private let changleDummy = ChangeMenuInfoData.Dummy()
    private let fixedDummy = FixedMenuInfoData.Dummy()
    
//    private var menuAllData: [Cha]
    
    let morningMenuProvider = MoyaProvider<HomeRouter>()

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
    
    // dormitory
    let dormitoryCoordinateButton = UIButton().then {
        $0.setImage(ImageLiteral.coordinate, for: .normal)
        $0.addTitleAttribute(title: TextLiteral.dormitoryRestaurant, titleColor: .black, fontName: .bold(size: 20))
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
    
    lazy var dormitoryTableView = MenuTableView()
    
    lazy var dormitoryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dormitoryCoordinateButton, dormitoryTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
//        stackView.backgroundColor = .blue
        return stackView
    }()
    
    // dodam
    private let dodamCoordinateButton = UIButton().then {
        $0.setImage(ImageLiteral.coordinate, for: .normal)
        $0.addTitleAttribute(title: TextLiteral.dodamRestaurant, titleColor: .black, fontName: .bold(size: 20))
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
    
    lazy var dodamTableView = MenuTableView()
    
    lazy var dodamStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dodamCoordinateButton, dodamTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    // student
    private let studentCoordinateButton = UIButton().then {
        $0.setImage(ImageLiteral.coordinate, for: .normal)
        $0.addTitleAttribute(title: TextLiteral.studentRestaurant, titleColor: .black, fontName: .bold(size: 20))
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }

    lazy var studentTableView = MenuTableView()
    
    lazy var studentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [studentCoordinateButton, studentTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()

    // foodcourt
    private let foodCourtCoordinateButton = UIButton().then {
        $0.setImage(ImageLiteral.coordinate, for: .normal)
        $0.addTitleAttribute(title: TextLiteral.foodCourt, titleColor: .black, fontName: .bold(size: 20))
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
    
    lazy var foodCourtTableView = MenuTableView()
    
    lazy var foodCourtStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [foodCourtCoordinateButton, foodCourtTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    // snackcorner
    private let snackCornerCoordinateButton = UIButton().then {
        $0.setImage(ImageLiteral.coordinate, for: .normal)
        $0.addTitleAttribute(title: TextLiteral.snackCorner, titleColor: .black, fontName: .bold(size: 20))
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
    
    lazy var snackCornerTableView = MenuTableView()
    
    lazy var snackCornerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [snackCornerCoordinateButton, snackCornerTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    // thekitchen
    private let theKitchenCoordinateButton = UIButton().then {
        $0.setImage(ImageLiteral.coordinate, for: .normal)
        $0.addTitleAttribute(title: TextLiteral.theKitchen, titleColor: .black, fontName: .bold(size: 20))
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
    
    lazy var theKitchenTableView = MenuTableView()
    
    lazy var theKitchenStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [theKitchenCoordinateButton, theKitchenTableView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .background
        setTableViewTagNumber()
        setupTableView()
//        getMenuTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(dormitoryStackView,
                         dodamStackView,
                         studentStackView,
                         foodCourtStackView,
                         snackCornerStackView,
                         theKitchenStackView)
    }
    
    override func setLayout() {
        
        [dormitoryTableView, dodamTableView, studentTableView, foodCourtTableView, snackCornerTableView, theKitchenTableView].forEach {
            $0.snp.makeConstraints {
                $0.width.equalToSuperview()
            }
        }
        
        [dormitoryStackView, dodamStackView, studentStackView, foodCourtStackView, snackCornerStackView, theKitchenStackView].forEach {
            $0.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(16)
            }
        }
        dormitoryStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
        }
        dodamStackView.snp.makeConstraints {
            $0.top.equalTo(dormitoryStackView.snp.bottom).offset(20)
        }
        studentStackView.snp.makeConstraints {
            $0.top.equalTo(dodamStackView.snp.bottom).offset(20)
        }
        foodCourtStackView.snp.makeConstraints {
            $0.top.equalTo(studentStackView.snp.bottom).offset(20)
        }
        snackCornerStackView.snp.makeConstraints {
            $0.top.equalTo(foodCourtStackView.snp.bottom).offset(20)
        }
        theKitchenStackView.snp.makeConstraints {
            $0.top.equalTo(snackCornerStackView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
        }
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
//        getDailyMorningMenuTable(date: "20230530", restaurant: "DODAM", tableView: dodamTableView)
    }
    
    func setupTableView() {
        [dormitoryTableView, dodamTableView, studentTableView, foodCourtTableView, snackCornerTableView, theKitchenTableView].forEach {
            $0.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            
            $0.layer.borderColor = UIColor.gray300.cgColor
            $0.layer.borderWidth = 1.0
            
            $0.estimatedRowHeight = 44  // 기본값으로 설정하거나 대략적인 높이를 설정
            $0.rowHeight = UITableView.automaticDimension

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

extension MorningView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag < 4 {
            return changleDummy.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell ?? MenuTableViewCell()
        if tableView.tag < 4 {
            cell.configureData(changleDummy[indexPath.row])

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

extension MorningView: UITableViewDelegate {}

extension MorningView: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        //크기 변경 됐을 경우
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}

// MARK: - Network

//extension MorningView {
//
//    func getFixedMorningMenuTable(restaurant: String, tableView: UITableView) {
//        self.morningMenuProvider.request(.getFixedRestaurantMenu(restaurant: restaurant)) { response in
//            switch response {
//            case .success(let moyaResponse):
//                do {
//                    print(moyaResponse.statusCode)
//                    let responseDetailDto = try moyaResponse.map(FixedMenuTableResponse.self)
//                    self.fixedMenuTableListDict[tableView.tag] = responseDetailDto.menuInfoList
//                    tableView.reloadData()
//                    print(responseDetailDto)
//                } catch(let err) {
//                    print(err.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//    }
//    func getDailyMorningMenuTable(date: String, restaurant: String, tableView: UITableView) {
//        self.morningMenuProvider.request(.getDailyMorningRestaurantMenu(date: date, restaurant: restaurant)) { response in
//            switch response {
//            case .success(let moyaResponse):
//                do {
//                    print(moyaResponse.statusCode)
//                    let responseDetailDto = try moyaResponse.map([DailyMenuTableResponse].self)
//
//                    for menuTable in responseDetailDto {
//                        self.dailyMenuTableListDict[menuTable.flag] = menuTable.dailyMenuInfoList
//                    }
//                    DispatchQueue.main.async {
//                        tableView.reloadData()
//                    }
//                    print("responseDetailDto: \(responseDetailDto)")
//                } catch(let err) {
//                    print(err.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//    }
//}
//
