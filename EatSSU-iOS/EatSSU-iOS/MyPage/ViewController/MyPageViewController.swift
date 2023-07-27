//
//  File.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/22.
//
import Foundation

import SnapKit
import UIKit

class MyPageViewController: BaseViewController {
    
    // MARK: - UI Components
    
    let mypageView = MyPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    
    // MARK: - Functions
    
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
    
    func setDelegate() {
        mypageView.myPageTableView.dataSource = self
        mypageView.myPageTableView.delegate = self
    }
}


extension MyPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mypageView.myPageServiceLabelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageServiceCell.identifier,
                                                       for: indexPath)
                as? MyPageServiceCell else {
            return MyPageServiceCell()
        }
        let title = mypageView.myPageServiceLabelList[indexPath.row].titleLabel
        cell.serviceLabel.text = title
        if title == TextLiteral.myReview {
            cell.rightItemLabel.text = mypageView.myPageRightItemListDate[0].rightArrow
        } else if title == TextLiteral.appVersion {
            cell.rightItemLabel.text = mypageView.myPageRightItemListDate[0].appVersion
        }
        return cell
    }
    
}

extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 { return }
        
        let myReviewViewController = MyReviewViewController()
        self.navigationController?.pushViewController(myReviewViewController, animated: true)
    }
    
}
