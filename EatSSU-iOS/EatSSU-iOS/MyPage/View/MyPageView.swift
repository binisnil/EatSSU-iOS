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
    
    var userImage = UIImageView().then {
        $0.image = ImageLiteral.profileIcon
    }
    var userNicknameButton = UIButton().then {
        $0.addTitleAttribute(title: "hellosoongsil1234 >", titleColor: .black, fontName: .semiBold(size: 20))
    }
    
    let accountTitleLabel = UILabel().then {
        $0.text = TextLiteral.linkedAccount
        $0.font = .regular(size: 14)
    }
    
    var accountLabel = UILabel().then {
        $0.text = "카카오"
        $0.font = .regular(size: 14)
    }
    
    var accountImage = UIImageView().then { $0.image = ImageLiteral.kakaoIcon }
    
    lazy var accountStackView = UIStackView(arrangedSubviews: [accountTitleLabel,
                                                               accountLabel,
                                                               accountImage]).then {
        $0.alignment = .center
        $0.axis = .horizontal
        $0.spacing = 20
    }
    
    let myPageTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.rowHeight = 55
        $0.isScrollEnabled = false
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(userImage,
                         userNicknameButton,
                         accountStackView,
                         myPageTableView)
    }
    override func setLayout() {
        userImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(127)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        userNicknameButton.snp.makeConstraints {
            $0.top.equalTo(userImage.snp.bottom).offset(6)
            $0.centerX.equalTo(userImage)
            $0.height.equalTo(40)
        }
        accountImage.snp.makeConstraints {
            $0.height.width.equalTo(20)
            
        }
        
        accountStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userNicknameButton.snp.bottom).offset(10)
        }
        myPageTableView.snp.makeConstraints {
            $0.top.equalTo(accountTitleLabel.snp.bottom).offset(71)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func register() {
        myPageTableView.register(MyPageServiceCell.self, forCellReuseIdentifier: MyPageServiceCell.identifier)
    }
    
}

