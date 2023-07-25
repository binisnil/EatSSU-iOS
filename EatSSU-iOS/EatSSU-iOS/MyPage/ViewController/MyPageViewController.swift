//
//  File.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/22.
//

import SnapKit
import Then

class MyPageViewController: BaseViewController {
    
    let mypageView = MyPageView()
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = "마이페이지"
    }
    
    override func configureUI() {
        view.addSubviews(mypageView)
    }
    
    override func setLayout() {
        mypageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
