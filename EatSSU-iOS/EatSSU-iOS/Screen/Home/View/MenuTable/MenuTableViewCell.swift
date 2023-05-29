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
    
    let menuIDLabel = UILabel()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let ratingLabel = UILabel()
    
    lazy var InfoTableStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel, ratingLabel])
        stackView.axis = .horizontal
//        stackView.setCustomSpacing(170, after: nameLabel)
//        stackView.setCustomSpacing(38, after: priceLabel)
        return stackView
    }()
    
    // MARK: - Functions
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(InfoTableStackView)
        
        [nameLabel,priceLabel,ratingLabel].forEach {
            $0.font = .medium(size: 14)
        }
        
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        InfoTableStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
        
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.width.equalTo(210)
        }
        priceLabel.snp.makeConstraints {
//            $0.centerX.equalTo(contentView.snp.centerX)
            $0.width.equalTo(75)
        }
        ratingLabel.snp.makeConstraints {
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-5)
            $0.width.equalTo(30)
        }
        
        
        
    }}
