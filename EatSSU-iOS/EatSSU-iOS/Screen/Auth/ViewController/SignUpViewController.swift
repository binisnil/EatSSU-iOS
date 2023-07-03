//
//  SignUpViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/04/03.
//

import UIKit

import SnapKit
import Then
import Moya

class SignUpViewController: BaseViewController {
    
    let authProvider = MoyaProvider<AuthRouter>()
    let realm = RealmService()
        
    // MARK: - UI Components
    
    let nicknameTextField = MainTextField("닉네임을 입력해주세요")
    let emailTextField = MainTextField("example@gmail.com")
    let pwTextField = MainTextField("비밀번호를 입력해주세요")
    let pwRewritingTextField = MainTextField("비밀번호를 확인해주세요")
    
    let nicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = .semiBold(size: 16)
        $0.textColor = .black
    }
    
    let nicknameRuleLabel = UILabel().then {
        $0.text = "2~8글자를 입력해주세요."
        $0.font = .semiBold(size: 12)
    }
    
    private lazy var nicknameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nicknameLabel, nicknameTextField, nicknameRuleLabel])
        stackView.axis = .vertical
        stackView.spacing = 9.0
        return stackView
    }()
    
    let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = .semiBold(size: 16)
    }
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stackView.axis = .vertical
        stackView.spacing = 9.0
        return stackView
    }()
    
    let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = .semiBold(size: 16)
    }
    
    let pwRuleLabel = UILabel().then {
        $0.text = "영문과 숫자를 포함하여 8자 이상을 입력해주세요."
        $0.font = .semiBold(size: 12)
    }
    
    private lazy var pwStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwLabel, pwTextField, pwRuleLabel])
        stackView.axis = .vertical
        stackView.spacing = 9.0
        return stackView
    }()
    
    let pwRewritingLabel = UILabel().then {
        $0.text = "비밀번호 확인"
        $0.font = .semiBold(size: 16)
    }
    
    private lazy var pwRewritingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwRewritingLabel, pwRewritingTextField])
        stackView.axis = .vertical
        stackView.spacing = 9.0
        return stackView
    }()
    
    let signUpButton = MainButton().then {
        $0.title = "완료하기"
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        customNavigationBar()
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(nicknameStackView,
                         emailStackView,
                         pwStackView,
                         pwRewritingStackView,
                         signUpButton)
    }
    
    override func setLayout() {
        nicknameStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(107)
            $0.centerX.equalToSuperview()
        }
        
        emailStackView.snp.makeConstraints {
            $0.top.equalTo(nicknameStackView.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
        
        pwStackView.snp.makeConstraints {
            $0.top.equalTo(emailStackView.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
        
        pwRewritingStackView.snp.makeConstraints {
            $0.top.equalTo(pwStackView.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-61)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        signUpButton.addTarget(self, action: #selector(tappedFinishButtonEvent), for: .touchUpInside)
    }
    
    @objc
    private func tappedFinishButtonEvent() {
        postSignUpRequest()
    }
    
    // MARK: - Server
    
    private func postSignUpRequest() {
        let param = SignUpRequest.init(emailTextField.text ?? "",
                                       pwTextField.text ?? "",
                                       nicknameTextField.text ?? "")
        self.authProvider.request(.signUp(param: param)) { response in
            switch response {
            case.success(let moyaResponse):
                do {
                    
                    /// SUCCESS
                    print(moyaResponse.statusCode)
                    let responseData = try moyaResponse.map(SignResponse.self)
                    self.addTokenInRealm(accessToken: responseData.accessToken,
                                         refreshToken: responseData.refreshToken)
                    self.pushToHome()
                    print(responseData)
                } catch(let err) {
                    
                    /// 400 ERROR
                    self.showFailAlert()
                    print(err.localizedDescription)
                }
                
            case .failure(let err):
                
                /// Extra ERROR
                print(MoyaError.statusCode)
                print(err.localizedDescription)
            }
        }
    }
    
    private func addTokenInRealm(accessToken:String, refreshToken:String) {
        realm.addToken(accessToken: accessToken, refreshToken: refreshToken)
        print(realm.getToken())
    }
    
    private func showFailAlert(){
        let alert = UIAlertController(title: "회원가입 실패", message: "입력을 완료하지 않았거나, 이미 가입된 이메일 입니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { okAction in
            self.nicknameTextField.text = ""
            self.emailTextField.text = ""
            self.pwTextField.text = ""
            self.pwRewritingTextField.text = ""
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func pushToHome() {
        let homeVC = HomeViewController()
        homeVC.isPreviewButtonTapped(preview: false)
        navigationController?.pushViewController(homeVC, animated: true)
    }
}

