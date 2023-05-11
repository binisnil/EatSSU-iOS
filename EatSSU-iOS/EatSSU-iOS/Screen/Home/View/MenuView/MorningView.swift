//
//  MorningView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/28.
//

import UIKit

import SnapKit
import Then

class MorningView: BaseUIView {
    
    // MARK: - UI Components
    
     var menus: [Menu] = []
    
    let coordinateButton = UIButton().then {
        $0.setImage(UIImage(named: "coordinate"), for: .normal)
    }
    
    let studentRestaurantLabel = UILabel().then {
        $0.text = "학생 식당"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
        
    lazy var restaurantTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [coordinateButton, studentRestaurantLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var menuTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
    }
    
    // MARK : - 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // 메뉴 데이터 초기화
           let menu1 = Menu(name: "스테이크", price: "30,000", rating: "4.5")
           let menu2 = Menu(name: "파스타", price: "20,000", rating: "4.0")
           let menu3 = Menu(name: "피자", price: "25,000", rating: "4.2")
           let menu4 = Menu(name: "샐러드", price: "15,000", rating: "3.8")
           
         menus = [menu1, menu2, menu3, menu4]
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    override func configureUI() {
//        self.addSubviews(contentScrollView)
//        contentScrollView.addSubview(contentView)
        self.addSubviews(restaurantTitleStackView,
                        menuTableView)
    }
    
    override func setLayout() {
        studentRestaurantLabel.snp.makeConstraints {
            $0.leading.equalTo(coordinateButton.snp.trailing).offset(10)
        }
        
        restaurantTitleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(160)
            $0.leading.equalToSuperview().offset(21)
        }
        
        menuTableView.snp.makeConstraints {
            $0.top.equalTo(restaurantTitleStackView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(358)
        }
        
//        headerViewLayout()
        
//        contentScrollView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//
//        contentView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//            $0.width.equalToSuperview()
//            $0.height.equalToSuperview()
//        }
    }
    
//    private func headerViewLayout() {
//           menuTableView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 500)
//       }
    
    func setupTableView() {
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.separatorStyle = .none
        
        menuTableView.layer.borderColor = UIColor.barGray.cgColor
        menuTableView.layer.borderWidth = 1.0
//        menuTableView.tableHeaderView = menuHeaderView
//        menuHeaderView.backgroundColor = .orange
    }
    
}

extension MorningView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell ?? MenuTableViewCell()
        let menu = menus[indexPath.row]
//        let formattedString = String(format: "%8s%8s%8s", menu.name, menu.price, menu.rating)
        
//        cell.textLabel?.text = String(format: "%15s%8s%8s", (menu.name as NSString).utf8String!, (menu.price as NSString).utf8String!, (menu.rating as NSString).utf8String!)

//        cell.textLabel?.text = String(format: "%8s", menu.name) + String(format: "%8s", menu.price) + String(format: "%8s", menu.rating)
//        let formattedName = String(format: "%8s", menu.name)
//        let formattedPrice = String(format: "%8s", menu.price)
//        let formattedRating = String(format: "%8s", menu.rating)
//
//        let menuLabel = (formattedName + formattedPrice + formattedRating)
  
        cell.textLabel?.text = "\(menu.name)                        \(menu.price)                         \(menu.rating)"
        cell.textLabel?.font = .regular(size: 14)
//        let formattedDetail = String(format: "%8s%8s", "\(menu.price)", "\(menu.rating)")
//        cell.detailTextLabel?.text = "\(menu.price) \(menu.rating)"
//        cell.detailTextLabel?.text = "가격: \(menu.price) 원, 평점: \(menu.rating)"
//        cell.detailTextLabel?.font = .regular(size: 14)
        // UITableViewCell의 separatorInset 조정
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)

        return cell
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
