//
//  LoginViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/28.
//

import UIKit
import AuthenticationServices

import SnapKit
import Then

class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let loginView = LoginView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonEvent()
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubviews(loginView)
    }
    
    override func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        loginView.previewButton.addTarget(self, action: #selector(didTappedPreviewBtn), for: .touchUpInside)
        loginView.signUPButton.addTarget(self, action: #selector(didTappedSignUpBtn), for: .touchUpInside)
        loginView.appleLoginButton.addTarget(self, action: #selector(didTappedAppleButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedPreviewBtn() {
        let nextVC = HomeViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    func didTappedSignUpBtn() {
        let nextVC = SignUpViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    private func didTappedAppleButton() {
        appleLoginRequest()
    }
    
    private func appleLoginRequest() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
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
