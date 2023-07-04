//
//  newLoginView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

class NewLoginView: BaseUIView {
    
    // MARK: - UI Components
    
    private let logoImage = UIImageView().then { $0.image = ImageLiteral.signInImage }
    
    private let appleLoginButton = UIButton().then {
        $0.addTitleAttribute(title: TextLiteral.signInWithApple, titleColor: .black, fontName: .regular(size: 18))
        $0.setImage(ImageLiteral.appleIcon, for: .normal)
        $0.setRoundBorder(borderColor: .black, borderWidth: 1.0, cornerRadius: 5.0)
        $0.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 200)
        $0.contentEdgeInsets = .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    private let kakaoLoginButton = UIButton().then {
        $0.addTitleAttribute(title: TextLiteral.signInWithKakao, titleColor: .black, fontName: .regular(size: 18))
        $0.backgroundColor = .yellow
        $0.contentEdgeInsets = .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    private let lookingButton = UIButton().then {
        $0.addTitleAttribute(title: TextLiteral.lookingWithNoSignIn, titleColor: .black, fontName: .regular(size: 18))
        $0.backgroundColor = .gray100
        $0.contentEdgeInsets = .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    private let buttonSelectView = UIView()
    
    override func configureUI() {
        [appleLoginButton, kakaoLoginButton, lookingButton].forEach {
            buttonSelectView.addSubview($0)
        }
        self.addSubviews(logoImage,
                         buttonSelectView)
    }
    
    override func setLayout() {
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(UIScreen.main.bounds.height / 3.9)
            $0.leading.trailing.equalToSuperview().inset(86)
        }
        buttonSelectView.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(160)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-(UIScreen.main.bounds.height / 3.5))
        }
        appleLoginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        kakaoLoginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(appleLoginButton.snp.bottom).offset(16)
        }
        lookingButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(16)
        }
    }
}
