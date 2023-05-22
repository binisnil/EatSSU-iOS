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
    private let contentView = UIView()

    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    let coordinateButton = UIButton().then {
        $0.setImage(UIImage(named: "coordinate"), for: .normal)
    }
    
    let studentRestaurantLabel = UILabel().then {
        $0.text = "기숙사 식당"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
        
    lazy var restaurantTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [coordinateButton, studentRestaurantLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var dormitoryTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }
    
    lazy var dodamTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }
    
    lazy var studentTableView = MenuTableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.layer.cornerRadius = 15.0
        $0.isScrollEnabled = false
    }

    // MARK: - init

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
        self.addSubviews(restaurantTitleStackView,
                         dormitoryTableView,
                        dodamTableView,
                         studentTableView)
    }
    
    override func setLayout() {
        restaurantTitleStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(21)
        }
        
        studentRestaurantLabel.snp.makeConstraints {
            $0.leading.equalTo(coordinateButton.snp.trailing).offset(10)
        }
        
        dormitoryTableView.snp.makeConstraints {
            $0.top.equalTo(restaurantTitleStackView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        
        dodamTableView.snp.makeConstraints {
            $0.top.equalTo(dormitoryTableView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        
        studentTableView.snp.makeConstraints {
            $0.top.equalTo(dodamTableView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupTableView() {
        [dormitoryTableView, dodamTableView, studentTableView].forEach {
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
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell ?? MenuTableViewCell()
        let menu = menus[indexPath.row]
        
        cell.nameLabel.text = menu.name
        cell.priceLabel.text = menu.price
        cell.ratingLabel.text = menu.rating
        
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
