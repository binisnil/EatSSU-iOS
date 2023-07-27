//
//  File.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/22.
//
import Foundation

import SnapKit
import Then

class MyPageViewController: BaseViewController {
    
    let mypageView = MyPageView()
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = TextLiteral.myPage
    }
    
    override func configureUI() {
        view.addSubviews(mypageView)
    }
    
    override func setLayout() {
        mypageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        mypageView.userNicknameButton.addTarget(self, action: #selector(didTappedChangeNicknameButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedChangeNicknameButton() {
        let changeNickNameVC = ChangeNicknameViewController()
        self.navigationController?.pushViewController(changeNickNameVC, animated: true)
    }
}
