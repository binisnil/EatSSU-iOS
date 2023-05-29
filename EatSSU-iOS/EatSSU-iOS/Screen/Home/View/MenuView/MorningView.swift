//
//  MorningView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/28.
//

import UIKit

import Moya
import SnapKit
import Then

class MorningView: BaseUIView {
    
    //MARK: - Properties
    
    let morningTableProvider = MoyaProvider<HomeRouter>()
    private var menuTableList = [MenuInfoList]()
    
    // MARK: - UI Components
    
//    var menus: [Menu] = []
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

        
        // 메뉴 데이터 초기화
//           let menu1 = Menu(name: "스테이크", price: "30,000", rating: "4.5")
//           let menu2 = Menu(name: "파스타", price: "20,000", rating: "4.0")
//           let menu3 = Menu(name: "피자", price: "25,000", rating: "4.2")
//           let menu4 = Menu(name: "샐러드", price: "15,000", rating: "3.8")
//
//        menus = [menu1, menu2, menu3, menu4]
        getMorningMenuTable(menuId: "SNACK_CORNER")
        setupTableView()

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
            }
        }
        
        allRestaurantStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        
        [dormitoryStackView,dodamStackView,studentStackView,foodCourtStackView,snackCornerStackView,theKitchenStackView].forEach {
            $0.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview().inset(16)
            }
        }
      
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
}


extension MorningView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("menuTableList.count: \(menuTableList.count)")
//        return 10
        return menuTableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell ?? MenuTableViewCell()
        
        let cellMenu: MenuInfoList = menuTableList[indexPath.row]
        print("cell Menu: \(cellMenu)")
//        cell.dataBind(nameLabel: cellMenu.name,
//                      priceLabel: cellMenu.price
//                      ratingLabel: cellMenu.grade)
        
        
//        let menu = menus[indexPath.row]
//
        cell.menuIDLabel.text = "\(cellMenu.menuId)"
        cell.nameLabel.text = cellMenu.name
        cell.priceLabel.text = "\(cellMenu.price)"
        cell.ratingLabel.text = "\(cellMenu.grade)"
        
        cell.textLabel?.font = .regular(size: 14)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        cell.selectionStyle = .none     // 셀 선택 비활성화
        
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

extension MorningView: UITableViewDelegate {
    
}

extension MorningView: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        //크기 변경 됐을 경우
        print(sheetPresentationController.selectedDetentIdentifier == .large ? "large" : "medium")
    }
}

// MARK: - Network

extension MorningView {
    
    func getMorningMenuTable(menuId: String) {
        self.morningTableProvider.request(.getRestaurantMenu(restaurant: menuId)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseDetailDto = try moyaResponse.map(MenuTableResponse.self)
                    self.menuTableList = responseDetailDto.menuInfoList ?? []
                    self.foodCourtTableView.reloadData()
                    print(responseDetailDto)
                    
                } catch(let err) {
                    print(err.localizedDescription)
            }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
//    func dataBind(name: String, price: Int, rating: Double) {
//        cell.nameLabel.text = name
//        cell.priceLabel.text = "\(price)"
//        cell.ratingLabel.text = "\(rating)"
//    }
}
//
//switch response {
//            case .success(let result):
//                let status = result.statusCode
//                if status >= 200 && status < 300 {
//                    do {
//                        let responseDetailDto = try result.map(BookDetailResponseDTO.self)
//                        self.fetchDetail(data: responseDetailDto)
//                    }
//                    catch(let error) {
//                        print(error.localizedDescription)
//                    }
//                } else if status >= 400 {
//                    print("400 error")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
