//
//  SignUpViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/04/03.
//

import UIKit

import SnapKit
import Then

class SignUpViewController : BaseViewController {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = .semiBold(size: 16)
    }
    let emailTextField = MainTextField("Ex) example@gmail.com")
//    let emailExLabel = UILabel().then {
//        $0.text = "Ex) example@gmail.com"
//        $0.font = .semiBold(size: 12)
//        $0.textColor = .darkGray
//    }
    let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = .semiBold(size: 16)
    }
    let pwTextField = MainTextField("영문, 숫자, 특수문자를 포함한 8~13자")
//    let pwExLabel = UILabel().then {
//        $0.text = "영문, 숫자, 특수문자를 포함한 8~13자"
//        $0.font = .semiBold(size: 12)
//        $0.textColor = .darkGray
//    }
    let pwRewritingLabel = UILabel().then {
        $0.text = "비밀번호 재입력"
        $0.font = .semiBold(size: 16)
    }
    let pwRewritingTextField = MainTextField(nil)
    let nicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = .semiBold(size: 16)
        $0.textColor = .black
    }
    let nicknameTextField = MainTextField("2~8글자를 입력해주세요.")
    let signUpButton = MainButton().then {
        $0.title = "완료하기"
    }
    
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        configureUI()
        setLayout()
    }
    
    //MARK: - Function
    
    override func configureUI() {
        view.addSubviews(emailLabel,
                         emailTextField,
                         signUpButton
                         )
    }
    
    override func setLayout() {
        emailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(16)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(16)
        }
        signUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-61)
            $0.centerX.equalToSuperview()
        }
      
     
    }
    
    override func setButtonEvent() {
    }
    
}
