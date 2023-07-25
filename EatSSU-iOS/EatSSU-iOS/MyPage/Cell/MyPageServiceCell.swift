//
//  MyPageServiceCell.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/25.
//

import UIKit

class MyPageServiceCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "MyPageServiceCell"
    
    // MARK: - UI Components
    
    var serviceLabel = UILabel().then {
        $0.font = .semiBold(size: 20)
        $0.textColor = .black
    }
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 

    // MARK: - Functions
    
    func configureUI() {
        self.addSubviews(serviceLabel)
    }
    
    func setLayout() {
        serviceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
        }
    }
}
