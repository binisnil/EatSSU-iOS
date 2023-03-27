//
//  MorningView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/28.
//

import UIKit
import SnapKit
import Then

class MorningView : BaseUIView {
    
    // MARK: - UI Components
    
    private let coordinateImage = UIImageView().then {
        $0.image = UIImage(named: "coordinate")
    }
    
    let studentRestaurantLabel = UILabel().then {
        $0.text = "학생 식당"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    //StackView
    
    lazy var restaurantTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [coordinateImage, studentRestaurantLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
  
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    override func configureUI() {
        self.addSubviews(restaurantTitleStackView)
    }
    
    override func setLayout() {
        studentRestaurantLabel.snp.makeConstraints {
            $0.leading.equalTo(coordinateImage.snp.trailing).offset(10)
        }
        restaurantTitleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(160)
            $0.leading.equalToSuperview().offset(21)
        }
    }
    
}
