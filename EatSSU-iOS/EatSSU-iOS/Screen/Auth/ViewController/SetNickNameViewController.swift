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
    
    // MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(setNickNameView)
    }
    
    override func setLayout() {
        setNickNameView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(25)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).inset(27)
        }
    }
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = TextLiteral.setNickName
    }
    
    override func setButtonEvent() {
        setNickNameView.completeSettingNickNameButton.addTarget(self, action: #selector(tappedCompleteNickNameButton), for: .touchUpInside)
    }
    
    @objc
    func tappedCompleteNickNameButton() {
        print("complete")
    }

}