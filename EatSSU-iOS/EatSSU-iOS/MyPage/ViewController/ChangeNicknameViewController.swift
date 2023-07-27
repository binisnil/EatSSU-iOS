//
//  ChangeNicknameViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/26.
//

import Foundation

import SnapKit
import Then

class ChangeNicknameViewController: BaseViewController {
    
    let changeNicknameView = SetNickNameView()
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = TextLiteral.changeNickname
    }
    
    override func configureUI() {
        view.addSubviews(changeNicknameView)
    }
    
    override func setLayout() {
        changeNicknameView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        changeNicknameView.completeSettingNickNameButton.addTarget(self, action: #selector(completedSettingNickname), for: .touchUpInside)
    }
    
    @objc
    func completedSettingNickname() {
        self.navigationController?.popViewController(animated: true)
    }
}
