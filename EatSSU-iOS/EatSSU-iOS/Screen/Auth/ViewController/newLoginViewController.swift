//
//  newLoginViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

class newLoginViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let loginView = newLoginView()
        
    // MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(loginView)
    }
    
    override func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
