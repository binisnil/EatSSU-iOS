//
//  HomeRestaurantView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/29.
//

import UIKit

import Moya
import SnapKit
import Then

class HomeRestaurantView: BaseUIView {
    
    //MARK: - Properties
    
    private var currentRestaurant = ""
    let menuProvider = MoyaProvider<HomeRouter>()
    private var changedMenuData: [ChangeMenuTableResponse] = [] {
        didSet {
            switch currentRestaurant {
            case "DODAM":
                dodamTableView.reloadData()
                break
            case "DOMITORY":
                dormitoryTableView.reloadData()
                break
            case "HAKSIK":
                studentTableView.reloadData()
            default:
                break
            }
        }
    }
    private var fixedMenuData: FixedMenuTableResponse? {
        didSet {
            switch currentRestaurant {
            case "SNACK_CORNER":
                snackCornerTableView.reloadData()
                break
            case "FOOD_COURT":
                foodCourtTableView.reloadData()
            case "THE_KITCHEN":
                theKitchenTableView.reloadData()
            default:
                break
            }
        }
    }
  
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
    
    func setupTableView() {
        [dormitoryTableView, dodamTableView, studentTableView, foodCourtTableView, snackCornerTableView, theKitchenTableView].forEach {
            $0.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            
            $0.layer.borderColor = UIColor.gray300.cgColor
            $0.layer.borderWidth = 1.0
            
            $0.estimatedRowHeight = 44  // 기본값으로 설정 / 대략적인 높이를 설정
            $0.rowHeight = UITableView.automaticDimension

        }
    }
}

extension HomeRestaurantView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag < 4 {
            return changedMenuData.count
        } else {
            return fixedMenuData?.fixMenuInfoList?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else {
            return MenuTableViewCell()
        }
        if tableView.tag < 4 {
            if(indexPath.row > changedMenuData.count-1) {
                return MenuTableViewCell()
            } else {
                cell.bind(menuData: changedMenuData[indexPath.row])
            }
            
        } else {
            if(indexPath.row > (fixedMenuData?.fixMenuInfoList?.count ?? 0)-1) {
                return MenuTableViewCell()
            } else {
                if let menu = fixedMenuData?.fixMenuInfoList?[indexPath.row] {
                        cell.bind(menuData: menu)
                }
            }
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

extension HomeRestaurantView: UITableViewDelegate {}

extension HomeRestaurantView: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        //크기 변경 됐을 경우
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}

// MARK: - Network

extension HomeRestaurantView {
    
    func getChangeMenuTableResponse(date: String, restaurant: String, time: String) {
        self.menuProvider.request(.getChangeMenuTableResponse(date: date, restaurant: restaurant, time: time)) { response in
            self.currentRestaurant = restaurant
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
            
                    let responseDetailDto = try moyaResponse.map([ChangeMenuTableResponse].self)
                    self.changedMenuData = responseDetailDto
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getFixedMenuTableResponse(restaurant: String) {
        self.menuProvider.request(.getFixedMenuTableResponse(restaurant: restaurant)) { response in
            self.currentRestaurant = restaurant
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    
                    let responseDetailDto = try moyaResponse.map(FixedMenuTableResponse.self)
                    self.fixedMenuData = responseDetailDto
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
