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
import Moya

//class LoginViewController: BaseViewController {
//
//    // MARK: - Properties
//
//    let authProvider = MoyaProvider<AuthRouter>()
//    let realm = RealmService()
//
//    // MARK: - UI Components
//
//    private let loginView = LoginView().then {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    private let loginScrollView = UIScrollView().then {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        /// 자동 로그인 풀고 싶을 때 한번 실행시켜주기
//        self.realm.resetDB()
//
//        /// 자동 로그인
//        if checkRealmToken() {
//            print(self.realm.getToken())
//            pushToHomeVC()
//        }
//
//        self.dismissKeyboard()
//    }
//
//    // MARK: - Functions
//
//    override func configureUI() {
//        view.backgroundColor = .systemBackground
//        view.addSubviews(loginView)
////        loginScrollView.addSubview(loginView)
//    }
//
//    override func setLayout() {
//
////        loginScrollView.snp.makeConstraints {
////            $0.edges.equalToSuperview()
////        }
//
//        loginView.snp.makeConstraints {
////            $0.width.equalToSuperview()
////            $0.top.equalToSuperview()
//            $0.edges.equalToSuperview()
//        }
//    }
//
//    override func setButtonEvent() {
//        loginView.previewButton.addTarget(self, action: #selector(didTappedPreviewBtn), for: .touchUpInside)
//        loginView.signUPButton.addTarget(self, action: #selector(didTappedSignUpBtn), for: .touchUpInside)
//        loginView.appleLoginButton.addTarget(self, action: #selector(didTappedAppleButton), for: .touchUpInside)
//        loginView.loginButton.addTarget(self, action: #selector(didTappedLoginButton), for: .touchUpInside)
//    }
//
//    override func customNavigationBar() {
//        navigationController?.isNavigationBarHidden = true
//    }
//
//    @objc
//    func didTappedPreviewBtn() {
//        let homeVC = HomeViewController()
////        homeVC.isPreviewButtonTapped(preview: true)
//        self.navigationController?.pushViewController(homeVC, animated: true)
//    }
//
//    @objc
//    private func didTappedLoginButton() {
//        let email = loginView.emailTextField.text
//        let password = loginView.pwTextField.text
//        if email != "" && password != "" {
//            postSignInRequest()
//        } else {
//            ifTextFieldEmpty()
//        }
//    }
//
//    @objc
//    func didTappedSignUpBtn() {
//        let nextVC = SignUpViewController()
//        self.navigationController?.pushViewController(nextVC, animated: true)
//    }
//
//    @objc
//    private func didTappedAppleButton() {
//        appleLoginRequest()
//    }
//
//    /// 요청으로 얻을 수 있는 값들: 이름, 이메일로 설정
//    private func appleLoginRequest() {
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        let request = appleIDProvider.createRequest()
//        request.requestedScopes = [.fullName, .email]
//
//        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
//        authorizationController.performRequests()
//    }
//
//    private func addTokenInRealm(accessToken:String, refreshToken:String) {
//        realm.addToken(accessToken: accessToken, refreshToken: refreshToken)
//        print(realm.getToken())
//    }
//
//    private func pushToHomeVC() {
//        let homeVC = HomeViewController()
////        homeVC.isPreviewButtonTapped(preview: false)
//        navigationController?.pushViewController(homeVC, animated: true)
//    }
//
//    private func showFailAlert(statusCode: Int){
//        var message: String{
//            switch statusCode {
//            case 400...499:
//                return "아이디 혹은 비밀번호를 확인해주세요."
//            case 500...599:
//                return "네트워크를 확인해주세요."
//            default:
//                return "알 수 없는 에러 발생"
//            }
//        }
//
//        let alert = UIAlertController(title: "로그인 실패", message: message, preferredStyle: UIAlertController.Style.alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: { okAction in
//            self.loginView.emailTextField.text = ""
//            self.loginView.pwTextField.text = ""
//        })
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
//    }
//
//    private func ifTextFieldEmpty() {
//        let title = "로그인 실패"
//        let message = "이메일 혹은 비밀번호를 입력해주세요."
//        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: { okAction in
//            self.loginView.emailTextField.text = ""
//            self.loginView.pwTextField.text = ""
//        })
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
//    }
//
//    func checkRealmToken()->Bool{
//        if realm.getToken() == ""{
//            return false
//        } else{
//            return true
//        }
//    }
//}
//
//extension LoginViewController {
//
//    // MARK: - Server
//
//    private func postSignInRequest() {
//        let param = SignInRequest.init(loginView.emailTextField.text ?? "",
//                                       loginView.pwTextField.text ?? "")
//        self.authProvider.request(.signIn(param: param)) { response in
//            switch response {
//            case.success(let moyaResponse):
//                do {
//
//                    ///SUCCESS
//                    print(moyaResponse.statusCode)
//                    let responseData = try moyaResponse.map(SignResponse.self)
//                    self.addTokenInRealm(accessToken: responseData.accessToken,
//                                         refreshToken: responseData.refreshToken)
//                    self.pushToHomeVC()
//                } catch (let err) {
//
//                    ///400 ERROR
//                    self.showFailAlert(statusCode: moyaResponse.statusCode)
//                    print(err.localizedDescription)
//                }
//            case.failure(let err):
//
//                /// Extra Error
//                print(MoyaError.statusCode)
//                print(err.localizedDescription)
//            }
//        }
//    }
//}
//
//extension LoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return self.view.window!
//    }
//
//    // Apple ID 연동 성공 시
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        switch authorization.credential {
//            // Apple ID
//        case let appleIDCredential as ASAuthorizationAppleIDCredential:
//
//            // 계정 정보 가져오기
//            let userIdentifier = appleIDCredential.user
//            let fullName = appleIDCredential.fullName
//            let email = appleIDCredential.email
//            let idToken = appleIDCredential.identityToken!
//            let tokeStr = String(data: idToken, encoding: .utf8)
//
//            print("User ID : \(userIdentifier)")
//            print("User Email : \(email ?? "")")
//            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
//            print("token : \(String(describing: tokeStr))")
//
//        default:
//            break
//        }
//    }
//
//    // Apple ID 연동 실패 시
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        print("Login in Fail.")
//    }
//}
