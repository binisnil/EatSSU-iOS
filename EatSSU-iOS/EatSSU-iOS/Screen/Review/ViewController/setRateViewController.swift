//
//  setRateViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/23.
//

import UIKit

class setRateViewController: BaseViewController {

    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "리뷰"
        label.font = .bold(size: 22)
        label.textColor = .black
        return label
    }()
    
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .primary
        return view
    }()
    
    private var menuLabel: UILabel = {
        let label = UILabel()
        label.text = "김치볶음밥 & 계란국을 평가해주세요"
        label.font = .semiBold(size: 20)
        label.textColor = .black
        return label
    }()
    
    private let introLabel: UILabel = {
        let label = UILabel()
        label.text = "식사는 맛있게 하셨나요?"
        label.font = .medium(size: 18)
        label.textColor = .darkGray
        return label
    }()
    
}
