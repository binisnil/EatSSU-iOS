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
        $0.textColor = .gray500
    }
    
    private var doubleCheckButton = UIButton().then {
        $0.setTitle(TextLiteral.doubleCheckNickName, for: .normal)
        $0.titleLabel?.font = .regular(size: 14)
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
    
    private let completeSettingNickNameButton = UIButton().then {
        $0.setTitle(TextLiteral.completeLabel, for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .semiBold(size: 18)
        $0.backgroundColor = .gray300
        $0.contentEdgeInsets = .init(top: 10, left: 0, bottom: 10, right: 0)
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
