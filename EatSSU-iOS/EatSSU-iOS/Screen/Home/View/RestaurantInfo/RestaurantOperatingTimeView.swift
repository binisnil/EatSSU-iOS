//
//  RestaurantOperatingTimeView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/23.
//

import UIKit

import SnapKit
import Then

class RestaurantOperatingTimeView: BaseUIView {
    
    // MARK: - UI Components
    
    private let morningTitleLabel = UILabel().then {
        $0.text = "조식"
        $0.font = .medium(size: 16)
        $0.textColor = .primary
    }
    private let lunchTitleLabel = UILabel().then {
        $0.text = "중식"
        $0.font = .medium(size: 16)
        $0.textColor = .primary
    }
    private let dinnerTitleLabel = UILabel().then {
        $0.text = "석식"
        $0.font = .medium(size: 16)
        $0.textColor = .primary
    }
    private var morningOpeningLabel = UILabel().then {
        $0.text = "11:30-14:00"
        $0.font = .medium(size: 16)
    }
    private var lunchOpeningLabel = UILabel().then {
        $0.text = "11:30-14:00"
        $0.font = .medium(size: 16)
    }
    private var dinnerOpeningLabel = UILabel().then {
        $0.text = "11:30-14:00"
        $0.font = .medium(size: 16)
    }
    lazy var morningStackView = UIStackView().then {
        $0.addArrangedSubviews([morningTitleLabel, morningOpeningLabel])
        $0.axis = .horizontal
        $0.spacing = 25
    }
    lazy var lunchStackView = UIStackView().then {
        $0.addArrangedSubviews([lunchTitleLabel, lunchOpeningLabel])
        $0.axis = .horizontal
        $0.spacing = 25
    }
    lazy var dinnerStackView = UIStackView().then {
        $0.addArrangedSubviews([dinnerTitleLabel, dinnerOpeningLabel])
        $0.axis = .horizontal
        $0.spacing = 25
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(morningStackView,
                        lunchStackView,
                        dinnerStackView)
    }
    
    override func setLayout() {
        morningStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(15)
        }
        lunchStackView.snp.makeConstraints {
            $0.top.equalTo(morningStackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.height.equalTo(15)
        }
        dinnerStackView.snp.makeConstraints {
            $0.top.equalTo(lunchStackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.height.equalTo(15)
        }
    }
}
