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
    let emailExLabel = UILabel().then {
        $0.text = "Ex) example@gmail.com"
        $0.font = .semiBold(size: 12)
        $0.textColor = .darkGray
    }
    let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = .semiBold(size: 16)
    }
    let pwExLabel = UILabel().then {
        $0.text = "영문, 숫자, 특수문자를 포함한 8~13자"
        $0.font = .semiBold(size: 12)
        $0.textColor = .darkGray
    }
    let pwRewritingLabel = UILabel().then {
        $0.text = "비밀번호 재입력"
        $0.font = .semiBold(size: 16)
    }
    let nicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = .semiBold(size: 16)
    }
    let signUpButton = MainButton()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
    }
    
    //MARK: - Function
    
    override func configureUI() {
        view.addSubviews(signUpButton)
    }
    
    override func setLayout() {
        signUpButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(50)
        }
    }
    
    override func setButtonEvent() {
    }
    
}
