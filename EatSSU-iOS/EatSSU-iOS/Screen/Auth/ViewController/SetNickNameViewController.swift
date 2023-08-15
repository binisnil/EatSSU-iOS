//
//  SetNickNameViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/04.
//

import UIKit

import Moya
import SnapKit
import Then
import Realm

class SetNickNameViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let setNicknameProvider = MoyaProvider<UserNicknameRouter>(plugins: [MoyaLoggingPlugin()])

    // MARK: - UI Components
    
    private let setNickNameView = SetNickNameView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissKeyboard()
    }
    
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
        self.setUserNickname(nickname: self.setNickNameView.inputNickNameTextField.text ?? "")
    }
}

extension SetNickNameViewController {
    private func setUserNickname(nickname: String) {
        self.setNicknameProvider.request(.setNickname(nickname: nickname)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    if let myPageViewController = self.navigationController?.viewControllers.first(where: { $0 is MyPageViewController }) {
                        self.navigationController?.popToViewController(myPageViewController, animated: true)
                    } else {
                        let homeViewController = HomeViewController()
                        self.navigationController?.pushViewController(homeViewController, animated: true)
                    }
                    print(moyaResponse.statusCode)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
