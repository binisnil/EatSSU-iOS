//
//  MorningViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit
import SnapKit

class MorningViewController: BaseViewController {
    
    //MARK: - UI Component
    
    // title View
    
    let coordinateImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coordinate")
        return imageView
    }()
    
    let studentRestaurantLabel : UILabel = {
        let label = UILabel()
        label.text = "학생 식당"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    // box View
    
    let todayMenuLabel : UILabel = {
        let label = UILabel()
        label.text = "오늘의 메뉴"
        label.font = UIFont.bold(size: 12)
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = UIFont.bold(size: 12)
        return label
    }()
    
    let ratingLabel : UILabel = {
        let label = UILabel()
        label.text = "평점"
        label.font = UIFont.bold(size: 12)
        return label
    }()
    
    //StackView
    
    lazy var restaurantTitleStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [coordinateImage, studentRestaurantLabel])
        stackView.axis = .horizontal
        stackView.backgroundColor = .orange
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var basicMenuFormStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [todayMenuLabel, priceLabel, ratingLabel])
        stackView.axis = .horizontal
        stackView.backgroundColor = .orange
        stackView.alignment = .leading
        return stackView
    }()
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Function
    
    override func configureUI() {
        view.addSubview(restaurantTitleStackView)
        view.addSubview(basicMenuFormStackView)
    }
    
    override func setLayout() {
//        coordinateImage.snp.makeConstraints{ make in
//            make.leading.equalToSuperview().offset(21)
//            make.top.equalToSuperview()
//
//        }
//        studentRestaurantLabel.snp.makeConstraints { make in
//            make.leading.equalTo(coordinateImage.snp.trailing).offset(10)
//        }
        restaurantTitleStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.top.equalToSuperview()
        }
        basicMenuFormStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    override func setButtonEvent() {
        
    }
}

