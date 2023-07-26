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
    private let myPageServiceLabelList = MyPageLocalData.myPageServiceLabelList
    private let myPageRightItemListDate = MyPageRightItemData.myPageRightItemList
    
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
    
    private let myPageTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.rowHeight = 55
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
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
    func setDelegate() {
        myPageTableView.dataSource = self
    }
    func register() {
        myPageTableView.register(MyPageServiceCell.self, forCellReuseIdentifier: MyPageServiceCell.identifier)
    }
    
}

extension MyPageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageServiceLabelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageServiceCell.identifier, for: indexPath) as? MyPageServiceCell else {
            return MyPageServiceCell()
        }
        let title = myPageServiceLabelList[indexPath.row].titleLabel
        cell.serviceLabel.text = title
        if title == TextLiteral.myReview {
            cell.rightItemLabel.text = myPageRightItemListDate[0].rightArrow
        } else if title == TextLiteral.appVersion {
            cell.rightItemLabel.text = myPageRightItemListDate[0].appVersion
        }
        return cell
    }
    
}
