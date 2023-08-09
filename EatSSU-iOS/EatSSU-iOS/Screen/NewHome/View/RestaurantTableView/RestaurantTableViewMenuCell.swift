//
//  RestaurantTableViewMenuCell.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/09.
//

import UIKit

import SnapKit

class RestaurantTableViewMenuCell: BaseTableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "RestaurantTableViewMenuCell"
    
    // MARK: - UI Components
    
    lazy var menuIDLabel = UILabel()
    lazy var nameLabel = UILabel().then {
        $0.text = "콩나물국+쌀밥+돈까스+케찹+무말랭이무침+구이김+배추김치+계란후라이"
        $0.font = .medium(size: 14)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping // 단어 단위 줄바꿈
    }
    lazy var priceLabel = UILabel().then {
        $0.text = "5000"
        $0.font = .medium(size: 14)
    }
    lazy var ratingLabel = UILabel().then {
        $0.text = "5.0"
        $0.font = .medium(size: 14)
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        super.configureUI()
        contentView.addSubviews(nameLabel,
                                priceLabel,
                                ratingLabel)
    }

    override func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.top.equalTo(contentView.snp.top).offset(11)
            $0.width.equalTo(210)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-5)  // bottom constraint 추가
        }
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(5)
            $0.width.equalTo(75)
            $0.centerY.equalTo(nameLabel)
        }
        ratingLabel.snp.makeConstraints {
            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
            $0.width.equalTo(30)
            $0.centerY.equalTo(nameLabel)
        }
    }
}
