//
//  newLoginViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/06/26.
//

import AuthenticationServices
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
    private let myProvider = MoyaProvider<MyRouter>(plugins: [MoyaLoggingPlugin()])


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
        loginView.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonDidTapped), for: .touchUpInside)
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
    
    private func pushToNicknameVC() {
        let setNicknameViewController = SetNickNameViewController()
        navigationController?.pushViewController(setNicknameViewController, animated: true)
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
        self.realm.resetDB()
        
        /// 자동 로그인
        if checkRealmToken() {
            print(self.realm.getToken())
            pushToHomeVC()
        }
    }
    
    /// 요청으로 얻을 수 있는 값들: 이름, 이메일로 설정
    private func appleLoginRequest() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func checkUserNickname(info: MyInfoResponse) {
        switch info.nickname {
        case "KAKAO유저", "APPLE유저":
            self.pushToNicknameVC()
        default:
            self.pushToHomeVC()
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
    
    @objc
    private func appleLoginButtonDidTapped() {
        appleLoginRequest()
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
                    self.getMyInfo()
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
    
    private func getMyInfo() {
        self.myProvider.request(.myInfo) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    let responseData = try moyaResponse.map(MyInfoResponse.self)
                    self.checkUserNickname(info: responseData)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
  
    func postAppleLoginRequest(token: String) {
        self.authProvider.request(.appleLogin(param: AppleLoginRequest(identityToken: token))) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseData = try moyaResponse.map(SignResponse.self)
                    self.addTokenInRealm(accessToken: responseData.accessToken,
                                         refreshToken: responseData.refreshToken)
                    
                    let setNicknameViewController = SetNickNameViewController()
                    self.navigationController?.pushViewController(setNicknameViewController, animated: true)
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

extension NewLoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            // 계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            let idToken = appleIDCredential.identityToken!
            let tokeStr = String(data: idToken, encoding: .utf8)
    
            postAppleLoginRequest(token: tokeStr ?? "")
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
            print("token : \(String(describing: tokeStr))")
            
        default:
            break
        }
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Login in Fail.")
    }
}

