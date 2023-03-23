//
//  BottomTagView.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/23.
//

import UIKit

class BottomTagView: BaseUIView {
    
    var tag1: UIButton = {
        let button = UIButton()
        button.setTitle("가성비가 좋아요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var tag2: UIButton = {
        let button = UIButton()
        button.setTitle("다른 데서 먹을래요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var tag3: UIButton = {
        let button = UIButton()
        button.setTitle("든든한 한 끼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var tag4: UIButton = {
        let button = UIButton()
        button.setTitle("그럭저럭해요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var tag5: UIButton = {
        let button = UIButton()
        button.setTitle("아쉬워요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()

    var tag6: UIButton = {
        let button = UIButton()
        button.setTitle("매워요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var tag7: UIButton = {
        let button = UIButton()
        button.setTitle("싱거워요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var tag8: UIButton = {
        let button = UIButton()
        button.setTitle("제 입맛엔 짜요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var tag9: UIButton = {
        let button = UIButton()
        button.setTitle("양이 많아요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var tag10: UIButton = {
        let button = UIButton()
        button.setTitle("빠르게 먹을 수 있어요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    lazy var topTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tag1, tag2])
        stackView.axis = .horizontal
        stackView.spacing = 22
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var secondTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tag3, tag4, tag5])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var thirdTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tag6, tag7, tag8])
        stackView.axis = .horizontal
        stackView.spacing = 19
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var bottomTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tag9, tag10])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var globalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topTagStackView, secondTagStackView, thirdTagStackView, bottomTagStackView])
        stackView.axis = .vertical
        stackView.spacing = 23
        stackView.alignment = .center
        return stackView
    }()
    
    override func configureUI() {
    }
    
    override func setLayout() {

    }
}
