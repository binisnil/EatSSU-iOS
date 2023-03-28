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
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    private let titleLabel = UILabel().then {
        $0.text = "EAT SSU"
        $0.font = UIFont.bold(size: 30)
        $0.textColor = UIColor.brandColor
    }
    private let loginAlertLabel = UILabel().then {
        $0.text = "서비스 이용을 위해 로그인 해주세요"
        $0.font = UIFont.regular(size: 16)
        $0.textColor = UIColor.gray1
    }
    
    private lazy var loginTopStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImage,titleLabel,loginAlertLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private var emailImage = UIImageView().then {
        $0.image = UIImage(systemName: "person.fill")
    }
    
    private lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일 아이디"
    }
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailImage,emailTextField])
        stackView.axis = .horizontal
        stackView.layer.borderColor = UIColor.brandColor.cgColor
        stackView.layer.borderWidth = 1.0
        stackView.layer.cornerRadius = 5.0
        return stackView
    }()
    
    private var pwImage = UIImageView().then {
        $0.image = UIImage(systemName: "lock.fill")
    }
    private lazy var pwTextField = UITextField().then {
        $0.placeholder = "비밀번호"
    }
    
    private lazy var pwStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwImage,pwTextField])
        stackView.layer.borderColor = UIColor.brandColor.cgColor
        stackView.layer.borderWidth = 1.0
        stackView.layer.cornerRadius = 10.0
        return stackView
    }()
    
    private lazy var loginButton = UIButton().then {
        $0.titleLabel?.font = UIFont(name: AppFontName.semiBoldFont.rawValue, size: 14)
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.brandColor, for: .normal)
        $0.layer.cornerRadius = 10.0
    }
    
    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailStackView,pwStackView,loginButton])
        stackView.axis = .vertical
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
        self.addSubviews(loginTopStackView,
                         userInfoStackView
        )
    }
    override func setLayout() {
        loginTopStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(118)
            $0.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(18)
        }
//        loginAlertLabel.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
//        }
        userInfoStackView.snp.makeConstraints {
            $0.top.equalTo(loginTopStackView.snp.bottom).offset(40)
        }
  
    }
    
}
