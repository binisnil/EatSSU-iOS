//
//  File.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/22.
//
import Foundation

import SnapKit
import UIKit
import Moya

class MyPageViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let myProvider = MoyaProvider<MyRouter>(plugins: [MoyaLoggingPlugin()])
    
    // MARK: - UI Components
    
    let mypageView = MyPageView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getMyInfo()
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
        
        let setNickNameVC = SetNickNameViewController()
        self.navigationController?.pushViewController(setNickNameVC, animated: true)
    }
    
    func setDelegate() {
        mypageView.myPageTableView.dataSource = self
        mypageView.myPageTableView.delegate = self
    }
}

// MARK: - Server

extension MyPageViewController {
    private func getMyInfo() {
        self.myProvider.request(.myInfo) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    let responseData = try moyaResponse.map(MyInfoResponse.self)
                    self.mypageView.dataBind(model: responseData)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
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
        cell.selectionStyle = .none
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
