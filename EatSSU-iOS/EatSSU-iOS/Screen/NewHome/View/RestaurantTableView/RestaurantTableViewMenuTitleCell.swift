//
//  RestaurantTableViewMenuTitleCell.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/09.
//

import UIKit

class RestaurantTableViewMenuTitleCell: BaseTableViewCell {
    
    // MARK:  - Properties
    
    static let identifier = "RestaurantTableViewMenuTitleCell"
    
    // MARK: - UI Components
    
    private let nameLabel = UILabel().then {
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
    
    private let lineView = UIView().then {
        $0.backgroundColor = .primary
    }
    
    lazy var infoTableStackView = UIStackView().then {
        $0.addArrangedSubviews([nameLabel, priceLabel, rateLabel])
        $0.axis = .horizontal
        $0.setCustomSpacing(170, after: nameLabel)
        $0.setCustomSpacing(38, after: priceLabel)
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        super.configureUI()
        contentView.addSubviews(infoTableStackView,
                                lineView)
    }
    
    override func setLayout() {
        infoTableStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(infoTableStackView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(334)
            $0.height.equalTo(2)
            $0.bottom.equalToSuperview()
        }

    }
}
