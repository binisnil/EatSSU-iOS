//
//  SignUpViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/04/03.
//

import UIKit

import SnapKit
import Then

class SignUpViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    let nicknameTextField = MainTextField("닉네임을 입력해주세요")
    let emailTextField = MainTextField("example@gmail.com")
    let pwTextField = MainTextField("비밀번호를 입력해주세요")
    
    let nicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = .semiBold(size: 16)
        $0.textColor = .black
    }
    
    let nicknameRuleLabel = UILabel().then {
        $0.text = "2~8글자를 입력해주세요."
        $0.font = .semiBold(size: 12)
        $0.textColor = .blackGray
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
        $0.textColor = .blackGray
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
    
    let pwRewritingTextField = MainTextField("비밀번호를 확인해주세요")
    private lazy var pwRewritingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwRewritingLabel, pwRewritingTextField])
        stackView.axis = .vertical
        stackView.spacing = 9.0
        return stackView
    }()
    
    let signUpButton = MainButton().then {
        $0.title = "완료하기"
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        customNavigationBar()
    }
    
    //MARK: - Function
    
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
    
    func customNavigationBar() {
            navigationController?.navigationBar.tintColor = .primary
            navigationController?.navigationBar.barTintColor = .white
            
            let backButton: UIBarButtonItem = UIBarButtonItem()
            backButton.title = ""
            navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
            
            navigationItem.title = "회원가입"
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.primary, NSAttributedString.Key.font: UIFont.bold(size: 22)]
        }
}
