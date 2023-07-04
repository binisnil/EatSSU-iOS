//
//  PostUIButton.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/04.
//

import UIKit

import SnapKit

class PostUIButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.backgroundColor = .gray300
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .semiBold(size: 18)
        self.layer.cornerRadius = 10
        self.contentEdgeInsets = UIEdgeInsets(top: 9, left: 0, bottom: 9, right: 0)
        self.contentHorizontalAlignment = .center
        self.isEnabled = false
    }
}
