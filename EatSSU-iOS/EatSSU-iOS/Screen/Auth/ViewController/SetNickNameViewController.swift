//
//  SetNickNameViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/04.
//

import UIKit

import SnapKit
import Then

class SetNickNameViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let setNickNameView = SetNickNameView()
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(setNickNameView)
    }
    
    override func setLayout() {
        setNickNameView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = TextLiteral.setNickName
    }

}
