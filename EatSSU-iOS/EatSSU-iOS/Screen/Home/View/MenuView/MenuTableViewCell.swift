//
//  MenuTableViewCell.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/10.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    // MARK:  - Properties
    
    static let identifier = "MenuTableViewCell"
    
    // MARK: - UI Components
    
    private let todayMenuLabel = UILabel().then {
        $0.text = "오늘의 메뉴"
        $0.font = .bold(size: 12)
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "가격"
        $0.font = .bold(size: 12)
    }
    
    private let rateLabel = UILabel().then {
        $0.text = "평점"
        $0.font = .bold(size: 12)
    }
    
    lazy var InfoTableStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [todayMenuLabel, priceLabel, rateLabel])
        stackView.axis = .horizontal
//        stackView.setCustomSpacing(170, after: todayMenuLabel)
        return stackView
    }()
    
    // MARK: - Functions
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configureUI()
//        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
//        self.contentView.addSubview(self.InfoTableStackView)
    }
    
    func setLayout() {
//        InfoTableStackView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(5)
//            $0.leading.equalToSuperview().offset(10)
//        }
    }

}
