//
//  LoginView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/28.
//

import UIKit
import AuthenticationServices

import SnapKit
import Then

class LoginView: BaseUIView {
    
    // MARK: - UI Components
    
    let previewButton = UIButton().then {
        $0.titleLabel?.font = .semiBold(size: 14)
        $0.setTitle("둘러보기", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
//        $0.addTarget(self, action: #selector(didTappedPreviewBtn), for: .touchUpInside)
    }
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo.png")
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "EAT SSU"
        $0.font = .bold(size: 30)
        $0.textColor = .primary
    }
    
    private let loginNoteLabel = UILabel().then {
        $0.text = "서비스 이용을 위해 로그인 해주세요"
        $0.font = .regular(size: 16)
        $0.textColor = .darkGray
    }
    
    private lazy var loginTopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImage, titleLabel, loginNoteLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    let emailTextField = UITextField().then {
        $0.placeholder = "이메일 아이디"
        $0.font = .regular(size: 14.0)
        $0.layer.borderColor = UIColor.primary.cgColor
        $0.layer.borderWidth = 1.0
        $0.layer.cornerRadius = 10.0
        $0.tintColor = .darkGray
        $0.addLeftPadding(width: 10.0)
        $0.addLeftImage(image: (UIImage(systemName: "person.fill")!))
    }
    
    let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = .regular(size: 14.0)
        $0.layer.borderColor = UIColor.primary.cgColor
        $0.layer.borderWidth = 1.0
        $0.layer.cornerRadius = 10.0
        $0.tintColor = .darkGray
        $0.addLeftPadding(width: 10.0)
        $0.addLeftImage(image: (UIImage(systemName: "lock.fill")!))
    }
    
    lazy var loginButton = UIButton().then {
        $0.titleLabel?.font = .semiBold(size: 14.0)
        $0.backgroundColor = .primary
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10.0
    }
    
    private lazy var userInputStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, pwTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 17.0
        return stackView
    }()
    
    private var googleLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "google"), for: .normal)
    }
    
    var appleLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "apple"), for: .normal)
    }
    
    private lazy var socialLoginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleLoginButton, appleLoginButton])
        stackView.axis = .horizontal
        stackView.spacing = 15.0
        return stackView
    }()
    
    private let pwFindButton = UIButton().then {
        $0.titleLabel?.font = .regular(size: 14.0)
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
    }
    
    let signUPButton = UIButton().then {
        $0.titleLabel?.font = .regular(size: 14.0)
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .mediumGray
    }
    
    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwFindButton, lineView, signUPButton])
        stackView.axis = .horizontal
        stackView.spacing = 27.5
        return stackView
    }()
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(previewButton,
                         loginTopStackView,
                         userInputStackView,
                         socialLoginStackView,
                         userInfoStackView)
    }
    
    override func setLayout() {
        previewButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(17)
        }
        
        loginTopStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        pwTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        userInputStackView.snp.makeConstraints {
            $0.top.equalTo(loginTopStackView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(72)
            $0.trailing.equalToSuperview().offset(-72)
        }
        
        socialLoginStackView.snp.makeConstraints {
            $0.top.equalTo(userInputStackView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        userInfoStackView.snp.makeConstraints {
            $0.top.equalTo(socialLoginStackView.snp.bottom).offset(25)
        }
        
        lineView.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.width.equalTo(1)
            $0.height.equalTo(16)
        }
        
        logoImage.snp.makeConstraints { make in
            make.height.width.equalTo(170)
        }
    }
}
