//
//  newLoginViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

class NewLoginViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let loginView = NewLoginView()
        
    // MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(loginView)
    }
    
    override func setLayout() {
        loginView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(UIScreen.main.bounds.height / 4.0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).inset(50)
        }
    }
}
