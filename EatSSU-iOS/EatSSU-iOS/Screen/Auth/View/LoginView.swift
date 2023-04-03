//
//  LoginView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/28.
//

import UIKit

import SnapKit
import Then

class LoginView : BaseUIView {
    
    // MARK: - UI Components
    let previewButton = UIButton().then {
        $0.titleLabel?.font = .semiBold(size: 14)
        $0.setTitle("둘러보기", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
//        $0.addTarget(self, action: #selector(didTappedPreviewBtn), for: .touchUpInside)
    }
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo.svg")
    }
    private let titleLabel = UILabel().then {
        $0.text = "EAT SSU"
        $0.font = .bold(size: 30)
        $0.textColor = .primary
    }
    private let loginAlertLabel = UILabel().then {
        $0.text = "서비스 이용을 위해 로그인 해주세요"
        $0.font = .regular(size: 16)
        $0.textColor = .darkGray
    }
    
    private lazy var loginTopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImage,titleLabel,loginAlertLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private var emailImage = UIImageView().then {
        let insets = UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5)
        $0.image = UIImage(systemName: "person.fill")?.withAlignmentRectInsets(insets)
//        $0.contentMode = .scaleAspectFill
        $0.tintColor = .darkGray
    }
    
    private lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일 아이디"
        $0.font = UIFont(name: AppFontName.regularFont.rawValue, size: 14.0)
    }
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailImage,emailTextField])
        stackView.axis = .horizontal
        stackView.layer.borderColor = UIColor.primary.cgColor
        stackView.layer.borderWidth = 1.0
        stackView.layer.cornerRadius = 10.0
        return stackView
    }()
    
    private var pwImage = UIImageView().then {
        $0.image = UIImage(systemName: "lock.fill")
        $0.tintColor = .darkGray
    }
    private lazy var pwTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = .regular(size: 14)
    }
    
    private lazy var pwStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwImage,pwTextField])
        stackView.layer.borderColor = UIColor.primary.cgColor
        stackView.layer.borderWidth = 1.0
        stackView.layer.cornerRadius = 10.0
        return stackView
    }()
    
    private lazy var loginButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: AppFontName.semiBoldFont.rawValue, size: 14)
        $0.backgroundColor = UIColor.primary
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10.0
    }
    
    private lazy var userInputStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailStackView,pwStackView,loginButton])
        stackView.axis = .vertical
        stackView.spacing = 17.0
        return stackView
    }()
    
    private var googleLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "google"), for: .normal)
    }
    
    private var appleLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "apple"), for: .normal)
    }
    
    private lazy var socialLoginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleLoginButton,appleLoginButton])
        stackView.axis = .horizontal
        stackView.spacing = 15.0
        return stackView
    }()
    
    private let pwFindButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: AppFontName.regularFont.rawValue, size: 14)
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor.darkGray, for: .normal)
    }
    
    private let signUPButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: AppFontName.regularFont.rawValue, size: 14)
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor.darkGray, for: .normal)
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = UIColor.mediumGray
    }
    
    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwFindButton,lineView,signUPButton])
        stackView.axis = .horizontal
        stackView.spacing = 27.5
        return stackView
    }()
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    override func configureUI() {
        self.addSubviews(previewButton,
                         loginTopStackView,
                         userInputStackView,
                         socialLoginStackView,
                         userInfoStackView
        )
    }
    override func setLayout() {
        previewButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(17)
        }
        loginTopStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(118)
            $0.centerX.equalToSuperview()
        }
//        titleLabel.snp.makeConstraints {
//            $0.top.equalTo(logoImage.snp.bottom).offset(18)
//        }
//        loginAlertLabel.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
//        }
//        emailImage.snp.makeConstraints {
//            $0.edges.equalToSuperview().offset(11)
//
//        }
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
            $0.centerX.equalToSuperview()
        }
        socialLoginStackView.snp.makeConstraints {
            $0.top.equalTo(userInputStackView.snp.bottom).offset(42)
            $0.centerX.equalToSuperview()
        }
        userInfoStackView.snp.makeConstraints {
            $0.top.equalTo(socialLoginStackView.snp.bottom).offset(45)
        }
        lineView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(16)
            $0.centerX.equalTo(self)
        }
  
    }
    
}
