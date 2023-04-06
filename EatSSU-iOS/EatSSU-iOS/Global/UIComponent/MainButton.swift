//
//  MainButton.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/04/03.
//

import UIKit

import SnapKit
import Then

class MainButton: UIButton {
    
    private enum Size {
        static let width: CGFloat = 358.0
        static let height: CGFloat = 40.0
    }
    
    // MARK: - property
    
    var title: String? {
        didSet {
            setupTitleAttribute()
        }
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    func configureUI() {
        titleLabel?.font = UIFont.semiBold(size: 14.0)
        titleLabel?.textColor = .white
        backgroundColor = .primary
        layer.cornerRadius = 10
    }
    
    func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(Size.width)
            $0.height.equalTo(Size.height)
        }
    }
    
    func setupTitleAttribute() {
        if let buttonTitle = title {
            setTitle(buttonTitle, for: .normal)
        }
    }
}
