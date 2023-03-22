//
//  ReviewTableCell.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/23.
//

import UIKit

import SnapKit

class ReviewTableCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "ReviewTableCell"
    private var personalRate = 4 ///dummy Data
    private var starButtons: [UIButton] = []
    
    //MARK: - UI Components
    
    lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.backgroundColor = .systemBackground
        return stackView
    }()
    
    lazy var starFillImage: UIImage? = {
        return UIImage(named: "starFilled.svg")
    }()
    
    lazy var starEmptyImage: UIImage? = {
        return UIImage(named: "starEmpty.svg")
    }()
    
    var starNumber: Int = 5 {
        didSet { setStarButtons() }
    }
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.03.03"
        label.font = .regular(size: 16)
        label.textColor = .mediumGray
        return label
    }()
    
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "hellosoongsil1234"
        label.font = .medium(size: 14)
        label.textColor = .black
        return label
    }()
    
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userProfile.svg")
        return imageView
    }()
    
    private var sideButton: UIButton = {
        let button = UIButton()
        button.setTitle("신고하기", for: .normal)
        button.setTitleColor(.mediumGray, for: .normal)
        button.titleLabel?.font = .regular(size: 14)
        return button
    }()
    
    private var reviewContentLabel: UILabel = {
        let label = UILabel()
        label.text = "여기 계란국 맛집임... 김치볶음밥에 계란후라이 없어서 아쉽 다음에 또 먹어야지"
        label.font = .regular(size: 16)
        label.textColor = .black
        return label
    }()
    
    //MARK: - Functions
    
    func setStarButtons(){
        for i in 0..<5 {
            let button = UIButton()
            button.setImage(starEmptyImage, for: .normal)
            button.tag = i
            starButtons += [button]
            starStackView.addArrangedSubview(button)
        }
    }
    
    func howManyStars(rate: Int) {
        let end = rate
        for i in 0...end {
            starButtons[i].setImage(starFillImage, for: .normal)
        }
        for i in end + 1..<starNumber {
            starButtons[i].setImage(starEmptyImage, for: .normal)
        }
    }
}
