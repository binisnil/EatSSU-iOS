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
    
    // MARK: - Properties
    
    private var userNickname: String = ""
    
    // MARK: - UI Components
    
    private let nickNameLabel = UILabel().then {
        $0.text = TextLiteral.nickNameLabel
        $0.font = .semiBold(size: 18)
    }
    
    let inputNickNameTextField = UITextField().then {
        $0.placeholder = TextLiteral.inputNickName
        $0.font = .regular(size: 12)
        $0.textColor = .black
        $0.setRoundBorder()
        $0.addLeftPadding()
        $0.clearButtonMode = .whileEditing
        
    }

    private let hintInputNickNameLabel = UILabel().then {
        $0.text = TextLiteral.hintInputNickName
        $0.textColor = .gray700
        $0.font = .semiBold(size: 12)
    }
    
    private lazy var setNickNameStackView: UIStackView = UIStackView(arrangedSubviews: [nickNameLabel, 
                                                                                        inputNickNameTextField,
                                                                                        hintInputNickNameLabel]).then {
        $0.axis = .vertical
        $0.spacing = 8.0
    }
    
    lazy var completeSettingNickNameButton = PostUIButton().then {
        $0.addTitleAttribute(title: TextLiteral.completeLabel, titleColor: .white, fontName: .semiBold(size: 18))
        $0.setRoundBorder(borderColor: .gray300, borderWidth: 0, cornerRadius: 10)
        $0.isEnabled = false
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget()
    }
    
    // MARK: Functions
    
    override func configureUI() {
        self.addSubviews(setNickNameStackView,
                         completeSettingNickNameButton)
    }
    
    override func setLayout() {
        setNickNameStackView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin).offset(31)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        completeSettingNickNameButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(61)
            $0.height.equalTo(40)
        }
        inputNickNameTextField.snp.makeConstraints {
            $0.height.equalTo(43.9)
        }
    }
    
    func addTarget() {
        inputNickNameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @objc
    func textFieldChanged(_ textField: UITextField) {
        if let text = textField.text, (text.count>1 && text.count<9) {
            completeSettingNickNameButton.isEnabled = true
            userNickname = text
        } else {
            completeSettingNickNameButton.isEnabled = false
        }
    }
}
