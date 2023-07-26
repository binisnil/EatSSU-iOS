//
//  newLoginViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/06/26.
//

import UIKit

import KakaoSDKUser
import Moya
import SnapKit
import Realm
import Then

final class NewLoginViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let loginView = NewLoginView()
    private let realm = RealmService()
    private let authProvider = MoyaProvider<AuthRouter>(plugins: [MoyaLoggingPlugin()])
    
    // MARK: - Life Cycles
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkUser()
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(loginView)
    }
    
    override func setLayout() {
        loginView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(UIScreen.main.bounds.height / 4.0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).inset(50)
        }
    }
    
    override func setButtonEvent() {
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonDidTapped), for: .touchUpInside)
    }
    
    private func getUserInfo() {
        UserApi.shared.me { user, error in
            if let error = error {
                print("🎃", error)
            } else {
                guard let email = user?.kakaoAccount?.email else { return }
                guard let id = user?.id else { return }
                self.postKakaoLoginRequest(email: email, id: String(id))
            }
        }
    }
    
    private func addTokenInRealm(accessToken:String, refreshToken:String) {
        realm.addToken(accessToken: accessToken, refreshToken: refreshToken)
        print("⭐️⭐️토큰 저장 성공~⭐️⭐️")
        print(realm.getToken())
    }
    
    private func pushToHomeVC() {
        let homeVC = HomeViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func checkRealmToken() -> Bool {
        if realm.getToken() == "" {
            return false
        } else {
            return true
        }
    }
    
    private func checkUser() {
        /// 자동 로그인 풀고 싶을 때 한번 실행시켜주기
//        self.realm.resetDB()
        
        /// 자동 로그인
        if checkRealmToken() {
            print(self.realm.getToken())
            pushToHomeVC()
        }
    }
    
    // MARK: - Action Methods
    
    @objc
    func kakaoLoginButtonDidTapped() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("⭐️⭐️사용자 동의 성공⭐️⭐️")
                    self.getUserInfo()
                }
            }
        }
    }
}

// MARK: - Network

extension NewLoginViewController {
    func postKakaoLoginRequest(email: String, id: String) {
        self.authProvider.request(.kakaoLogin(param: KakaoLoginRequest(email: email,
                                                                       providerId: id))) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseData = try moyaResponse.map(SignResponse.self)
                    self.addTokenInRealm(accessToken: responseData.accessToken,
                                         refreshToken: responseData.refreshToken)
                    self.pushToHomeVC()
                    print(responseData)
                } catch(let err) {
                    self.presentBottomAlert(err.localizedDescription)
                    print(err.localizedDescription)
                }
            case .failure(let err):
                self.presentBottomAlert(err.localizedDescription)
                print(err.localizedDescription)
            }
        }
    }
}
