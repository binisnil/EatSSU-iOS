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
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023.03.03"
        label.font = .regular(size: 12)
        label.textColor = .darkGray
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
    
    var firstUserTag: UIButton = {
        let button = UIButton()
        button.setTitle("든든한 한 끼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 11)
        return button
    }()
    
    var secondUserTag: UIButton = {
        let button = UIButton()
        button.setTitle("그럭저럭해요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 11)
        return button
    }()
    
    var thirdUserTag: UIButton = {
        let button = UIButton()
        button.setTitle("아쉬워요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.2
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .medium(size: 11)
        return button
    }()
    
    var reviewTextView : UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .systemBackground
        textView.font = .regular(size: 16)
        textView.text = "여기 계란국 맛집임... 김치볶음밥에 계란후라이 없어서 아쉽 다음에 또 먹어야지"

        return textView
    }()
    
    lazy var rateDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starStackView, dateLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, rateDateStackView])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userProfileImageView, infoStackView])
        stackView.axis = .horizontal
        stackView.spacing = 11
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var userTagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstUserTag, secondUserTag, thirdUserTag])
        stackView.axis = .horizontal
        stackView.spacing = 19
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewTextView,userTagStackView])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .leading
        return stackView
    }()
    
    //MARK: - Functions
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.profileStackView)
        self.contentView.addSubview(self.sideButton)
        self.contentView.addSubview(self.contentStackView)
        setLayout()
        setStarButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        profileStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(16)
        }
        sideButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileStackView.snp.top).offset(3)
            make.trailing.equalToSuperview().offset(-16)
        }
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(profileStackView.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        firstUserTag.snp.makeConstraints { make in
            make.height.equalTo(19)
        }
        
        secondUserTag.snp.makeConstraints { make in
            make.height.equalTo(19)
        }
        
        thirdUserTag.snp.makeConstraints { make in
            make.height.equalTo(19)
        }
    }
    
    func setStarButtons() {
        for i in 0...personalRate - 1 {
            let button = UIButton()
            button.setImage(starFillImage, for: .normal)
            button.snp.makeConstraints { make in
                make.height.equalTo(11.19)
                make.width.equalTo(11.71)
            }
            button.tag = i
            starButtons += [button]
            starStackView.addArrangedSubview(button)
        }
        
        for i in personalRate..<5 {
            let button = UIButton()
            button.setImage(starEmptyImage, for: .normal)
            button.snp.makeConstraints { make in
                make.height.equalTo(11.19)
                make.width.equalTo(11.71)
            }
            button.tag = i
            starButtons += [button]
            starStackView.addArrangedSubview(button)
        }
    }
}
