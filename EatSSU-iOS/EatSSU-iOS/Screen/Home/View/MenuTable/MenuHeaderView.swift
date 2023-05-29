//
//  MenuHeaderView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/10.
//

import UIKit

import SnapKit
import Then

class MenuHeaderView: BaseUIView {
    
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
    
    private let lineView = UIView().then {
        $0.backgroundColor = .primary
    }
    
    lazy var InfoTableStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [todayMenuLabel, priceLabel, rateLabel])
        stackView.axis = .horizontal
        stackView.setCustomSpacing(170, after: todayMenuLabel)
        stackView.setCustomSpacing(38, after: priceLabel)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(InfoTableStackView,
                         lineView)
    }
    
    override func setLayout() {
        InfoTableStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(InfoTableStackView.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(334)
            $0.height.equalTo(2)
        }
    }
}
