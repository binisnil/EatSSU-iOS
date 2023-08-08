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
    
    typealias handler = ((String) -> (Void))
    private let setNicknameProvider = MoyaProvider<UserNicknameRouter>(plugins: [MoyaLoggingPlugin()])
    var completionHandler: handler?

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
        setUserNickname(nickname: setNickNameView.inputNickNameTextField.text ?? "")
        completionHandler?(setNickNameView.inputNickNameTextField.text ?? "")
        if let myPageViewController = self.navigationController?.viewControllers.first(where: { $0 is MyPageViewController }) {
            self.navigationController?.popToViewController(myPageViewController, animated: true)
        } else {
            let homeViewController = HomeViewController()
//            homeViewController.nickName = setNickNameView.inputNickNameTextField.text ?? ""
            self.navigationController?.pushViewController(homeViewController, animated: true)
        }
        
    }
}

extension SetNickNameViewController {
    private func setUserNickname(nickname: String) {
        let param = UserNicknameRequest.init(nickname)
        self.setNicknameProvider.request(.setNickname(nickname: nickname)) {
            response in
            
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
