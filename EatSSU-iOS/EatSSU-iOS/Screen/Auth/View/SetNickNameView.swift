//
//  setNickNameView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/03.
//

import UIKit

import SnapKit
import Then

class SetNickNameView: BaseUIView {
    
    private let nickNameLabel = UILabel().then {
        $0.text = TextLiteral.nickNameLabel
        $0.font = .semiBold(size: 18)
    }
    
    private let inputNickNameTextField = UITextField().then {
        $0.placeholder = TextLiteral.inputNickName
        $0.font = .regular(size: 12)
        $0.textColor = .black
        $0.setRoundBorder()
        $0.addLeftPadding()
    }
    
    lazy var doubleCheckButton = UIButton().then {
        $0.addTitleAttribute(title: TextLiteral.doubleCheckNickName, titleColor: .white, fontName: .regular(size: 14))
        $0.setBackgroundColor(.gray300, for: .normal)
        $0.setRoundBorder(borderColor: .gray300, borderWidth: 0.0, cornerRadius: 10.0)
        $0.contentEdgeInsets = .init(top: 12.0, left: 12.0, bottom: 12.0, right: 12.0)
    }

    private let hintInputNickNameLabel = UILabel().then {
        $0.text = TextLiteral.hintInputNickName
        $0.font = .semiBold(size: 12)
    }
    
    private lazy var userInputNickNameStackView: UIStackView = UIStackView(arrangedSubviews: [inputNickNameTextField, doubleCheckButton]).then {
        $0.axis = .horizontal
        $0.spacing = 5.0
    }
    
    private lazy var setNickNameStackView: UIStackView = UIStackView(arrangedSubviews: [nickNameLabel, userInputNickNameStackView, hintInputNickNameLabel]).then {
        $0.axis = .vertical
        $0.spacing = 8.0
    }
    
    lazy var completeSettingNickNameButton = PostUIButton().then {
        $0.addTitleAttribute(title: TextLiteral.completeLabel, titleColor: .white, fontName: .semiBold(size: 18))
        $0.setRoundBorder(borderColor: .gray300, borderWidth: 0, cornerRadius: 10)
    }
    
    override func configureUI() {
        self.addSubviews(setNickNameStackView,
                         completeSettingNickNameButton)
    }
    
    override func setLayout() {
        setNickNameStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(UIScreen.main.bounds.height / 7.5)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        completeSettingNickNameButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-(UIScreen.main.bounds.height / 13.8))
            $0.height.equalTo(40)
        }
    }
}
