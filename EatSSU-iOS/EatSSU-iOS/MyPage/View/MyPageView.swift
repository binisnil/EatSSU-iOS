//
//  MyPageView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/25.
//

import UIKit

import SnapKit
import Then

class MyPageView: BaseUIView {
    
    // MARK: - Properties
    
    let myPageServiceLabelList = MyPageLocalData.myPageServiceLabelList
    let myPageRightItemListDate = MyPageRightItemData.myPageRightItemList
    
    // MARK: - UI Components
    
    var userNicknameButton = UIButton().then {
        $0.setImage(ImageLiteral.profileIcon, for: .normal)
        $0.addTitleAttribute(title: "hellosoongsil1234 >", titleColor: .black, fontName: .semiBold(size: 20))
        $0.alignTextBelow()
    }
    
    let accountTitleLabel = UILabel().then {
        $0.text = TextLiteral.linkedAccount
        $0.font = .regular(size: 14)
    }
    
    var accountLabel = UILabel().then {
        $0.text = "Apple"
        $0.font = .regular(size: 14)
    }
    
    var accountImage = UIImageView().then { $0.image = ImageLiteral.signInWithApple }
    
    let myPageTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.rowHeight = 55
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(userNicknameButton,
                         accountTitleLabel,
                         accountLabel,
                         accountImage,
                         myPageTableView)
    }
    override func setLayout() {
        userNicknameButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(127)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(150)
            $0.width.equalTo(170)
        }
        accountTitleLabel.snp.makeConstraints {
            $0.top.equalTo(userNicknameButton.snp.bottom).offset(10)
            $0.leading.equalTo(userNicknameButton)
        }
        accountLabel.snp.makeConstraints {
            $0.top.equalTo(accountTitleLabel)
            $0.leading.equalTo(accountTitleLabel.snp.trailing).offset(20)
        }
        accountImage.snp.makeConstraints {
            $0.top.equalTo(accountTitleLabel)
            $0.trailing.equalTo(userNicknameButton)
        }
        myPageTableView.snp.makeConstraints {
            $0.top.equalTo(accountTitleLabel.snp.bottom).offset(71)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(215)
        }
    }
    
    func register() {
        myPageTableView.register(MyPageServiceCell.self, forCellReuseIdentifier: MyPageServiceCell.identifier)
    }
    
}

