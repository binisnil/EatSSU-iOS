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
    
    var model: MenuTypeInfo? {
        didSet {
            if let model = model {
                bind(model)
            }
        }
    }
    
    // MARK: - UI Components
    
    lazy var menuIDLabel = UILabel()
    lazy var nameLabel = UILabel().then {
        $0.font = .medium(size: 14)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping // 단어 단위 줄바꿈
    }
    lazy var priceLabel = UILabel().then {
        $0.font = .medium(size: 14)
    }
    lazy var ratingLabel = UILabel().then {
        $0.font = .medium(size: 14)
    }
    
    // MARK: - Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()

        nameLabel.text = nil
        priceLabel.text = nil
        ratingLabel.text = nil
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
    
    func bind(_ model: MenuTypeInfo) {
        switch model {
        case .change(let data):
            priceLabel.text = String(data.price)
            ratingLabel.text = String(data.mainGrade ?? 0)
            nameLabel.text = data.changeMenuInfoList.map { $0.name }.joined(separator: "+")
        
        case .fix(let data):
            priceLabel.text = String(data.price)
            ratingLabel.text = String(data.mainGrade)
            nameLabel.text = data.name
        }
    }
}
