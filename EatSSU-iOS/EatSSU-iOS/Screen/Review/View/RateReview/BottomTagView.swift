//
//  BottomTagView.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/23.
//

import UIKit

import SnapKit

class BottomTagView: BaseUIView {
    
    // MARK: - UI Components
        
    lazy var tag1: UIButton = {
        let button = UIButton()
        button.setTitle("가성비가 좋아요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    lazy var tag2: UIButton = {
        let button = UIButton()
        button.setTitle("다른 데서 먹을래요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    lazy var tag3: UIButton = {
        let button = UIButton()
        button.setTitle("든든한 한 끼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    lazy var tag4: UIButton = {
        let button = UIButton()
        button.setTitle("그럭저럭해요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    lazy var tag5: UIButton = {
        let button = UIButton()
        button.setTitle("아쉬워요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()

    lazy var tag6: UIButton = {
        let button = UIButton()
        button.setTitle("매워요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    lazy var tag7: UIButton = {
        let button = UIButton()
        button.setTitle("싱거워요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    lazy var tag8: UIButton = {
        let button = UIButton()
        button.setTitle("제 입맛엔 짜요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    lazy var tag9: UIButton = {
        let button = UIButton()
        button.setTitle("양이 많아요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    lazy var tag10: UIButton = {
        let button = UIButton()
        button.setTitle("빠르게 먹을 수 있어요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 16)
        return button
    }()
    
    private let tagLimitLabel: UILabel = {
        let label = UILabel()
        label.text = "태그는 최대 3개까지 선택 가능합니다"
        label.font = .regular(size: 12)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var topTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tag1, tag2])
        stackView.axis = .horizontal
        stackView.spacing = 22
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var secondTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tag3, tag4, tag5])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var thirdTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tag6, tag7, tag8])
        stackView.axis = .horizontal
        stackView.spacing = 19
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var bottomTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tag9, tag10])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var globalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topTagStackView, secondTagStackView, thirdTagStackView, bottomTagStackView, tagLimitLabel])
        stackView.axis = .vertical
        stackView.spacing = 23
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubview(globalStackView)
    }
    
    override func setLayout() {
        globalStackView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        tag1.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.height.equalTo(30.62)
        }
        
        tag2.snp.makeConstraints { make in
            make.width.equalTo(165)
            make.height.equalTo(30.62)
        }
        
        tag3.snp.makeConstraints { make in
            make.width.equalTo(113)
            make.height.equalTo(30.62)
        }
        
        tag4.snp.makeConstraints { make in
            make.width.equalTo(117)
            make.height.equalTo(30.62)
        }
        
        tag5.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(30.62)
        }
        
        tag6.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(30.62)
        }
        
        tag7.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(30.62)
        }
        
        tag8.snp.makeConstraints { make in
            make.width.equalTo(137)
            make.height.equalTo(30.62)
        }
        
        tag9.snp.makeConstraints { make in
            make.width.equalTo(113)
            make.height.equalTo(30.62)
        }
        
        tag10.snp.makeConstraints { make in
            make.width.equalTo(174)
            make.height.equalTo(30.62)
        }
    }
}
