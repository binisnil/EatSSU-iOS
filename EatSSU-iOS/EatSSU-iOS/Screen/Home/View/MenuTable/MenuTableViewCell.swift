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
    
    var inputData: FixedMenuInfoData? {
        didSet {
            configureCell(inputData)
        }
    }
    
    // MARK: - UI Components
    
    let menuIDLabel = UILabel()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let ratingLabel = UILabel()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        contentView.addSubviews(nameLabel,
                               priceLabel,
                               ratingLabel)
        
        setLabel()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    
    func setLabel() {
        nameLabel.do {
            $0.numberOfLines = 0
            // 단어 단위의 줄바꿈
            $0.lineBreakMode = .byWordWrapping
        }
        [nameLabel,priceLabel,ratingLabel].forEach {
            $0.font = .medium(size: 14)
        }
    }
    
    func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.top.equalTo(contentView.snp.top).offset(11)
            $0.width.equalTo(210)
        }
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(5)
            $0.width.equalTo(75)
            $0.centerY.equalTo(nameLabel)
        }
        ratingLabel.snp.makeConstraints {
            $0.trailing.equalTo(contentView.snp.trailing).offset(-27)
            $0.width.equalTo(30)
            $0.centerY.equalTo(nameLabel)
        }
        nameLabel.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom).offset(-5)  // bottom constraint 추가
        }
    }
    
    func configureData(_ model: ChangeMenuInfoData?) {
        guard let model = model else { return }
        priceLabel.text = String(model.price)
        ratingLabel.text = String(model.mainGrage)
        nameLabel.text = model.changeMenuInfoList.map { $0.name }.joined(separator: "+")
    }
    
    func configureCell(_ model: FixedMenuInfoData?) {
        guard let model = model else { return }
        priceLabel.text = String(model.price)
        ratingLabel.text = String(model.mainGrade)
        nameLabel.text = model.name
    }
    
    func bind(menuData: ChangeMenuTableResponse?) {
        guard let menuData = menuData else { return }
        priceLabel.text = String(menuData.price)
        ratingLabel.text = String(menuData.mainGrade!)
        nameLabel.text = menuData.changeMenuInfoList.map { $0.name }.joined(separator: "+")
    }

    func bind(menuData: FixedMenuInfo?) {
        guard let menuData = menuData else { return }
        nameLabel.text = menuData.name
        ratingLabel.text = String(menuData.mainGrade)
        priceLabel.text = String(menuData.price)
    }
}
