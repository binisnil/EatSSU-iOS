//
//  ReviewTableCell.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/23.
//

import UIKit

import SnapKit

class ReviewTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ReviewTableCell"
    var handler: (() -> (Void))?
    
    // MARK: - UI Components
    
    lazy var totalRateView = RateNumberView()
    lazy var tasteRateView = RateNumberView()
    lazy var quantityRateView = RateNumberView()
    
    private let tasteLabel: UILabel = {
        let label = UILabel()
        label.text = "맛"
        label.font = .medium(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "양"
        label.font = .medium(size: 12)
        label.textColor = .black
        return label
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
        label.font = .regular(size: 12)
        label.textColor = .gray500
        return label
    }()
    
    private var menuNameLabel: UILabel = {
        let label = UILabel()
        label.text = "계란국"
        label.font = .semiBold(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userProfile.svg")
        return imageView
    }()
    
    private var sideButton: BaseButton = {
        let button = BaseButton()
        button.setTitleColor(.gray500, for: .normal)
        button.titleLabel?.font = .regular(size: 14)
        return button
    }()
    
    var reviewTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .systemBackground
        textView.font = .regular(size: 16)
        textView.text = "여기 계란국 맛집임... 김치볶음밥에 계란후라이 없어서 아쉽 다음에 또 먹어야지"
        return textView
    }()
    
    var foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo.png")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    /// 맛 별점
    lazy var tasteStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tasteLabel, tasteRateView])
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .center
        return stackView
    }()
    
    /// 양 별점
    lazy var quantityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quantityLabel, quantityRateView])
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .center
        return stackView
    }()
    
    /// 별점
    lazy var rateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalRateView, tasteStackView, quantityStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    ///이름 + 메뉴
    lazy var nameMenuStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, menuNameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    /// 이름 + 메뉴 + 별점
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameMenuStackView, rateStackView])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    /// 프로필 + 이름 + 메뉴 + 별점
    lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userProfileImageView, infoStackView])
        stackView.axis = .horizontal
        stackView.spacing = 11
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var dateReportStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, sideButton])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .trailing
        return stackView
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewTextView,foodImageView])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .leading
        return stackView
    }()
    
    // MARK: - Functions
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.profileStackView)
        self.contentView.addSubview(self.dateReportStackView)
        self.contentView.addSubview(self.contentStackView)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        sideButton.setTitle("", for: .normal)
    }
    
    func setLayout() {
        profileStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(16)
        }
        
        dateReportStackView.snp.makeConstraints { make in
            make.centerY.equalTo(profileStackView)
            make.trailing.equalToSuperview().inset(16)
        }
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(profileStackView.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-15)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        foodImageView.snp.makeConstraints { make in
            make.height.width.equalTo(358)
        }
    }
    
//    @objc
//    func touchedReportButtonEvent() {
//        handler?()
//    }
    
    @objc
    func touchedSideButtonEvent() {
        handler?()
    }
}

// MARK: - Data Bind

extension ReviewTableCell {
    func dataBind(response: MenuDataList) {
        menuNameLabel.text = response.menu
        userNameLabel.text = response.writerNickname
        totalRateView.rateNumberLabel.text = "\(response.mainGrade)"
        quantityRateView.rateNumberLabel.text = "\(response.amountGrade)"
        tasteRateView.rateNumberLabel.text = "\(response.tasteGrade)"
        dateLabel.text = response.writeDate
        reviewTextView.text = response.content
        if response.imgURLList.count != 0 {
            foodImageView.isHidden = false
            foodImageView.kfSetImage(url: response.imgURLList[0])
        } else {
            foodImageView.isHidden = true
        }
        
        if response.isWriter {
            sideButton.setImage(ImageLiteral.greySideButton, for: .normal)
            sideButton.addTarget(self, action: #selector(touchedSideButtonEvent), for: .touchUpInside)

        } else {
            sideButton.setTitle("신고", for: .normal)
            sideButton.addTarget(self, action: #selector(touchedSideButtonEvent), for: .touchUpInside)
        }
    }
    
    func myPageDataBind(response: MyDataList) {
        userNameLabel.text = "닉네임넣기"
        menuNameLabel.text = response.menuName
        totalRateView.rateNumberLabel.text = "\(response.mainGrade)"
        quantityRateView.rateNumberLabel.text = "\(response.amountGrade)"
        tasteRateView.rateNumberLabel.text = "\(response.tasteGrade)"
        dateLabel.text = response.writeDate
        reviewTextView.text = response.content
        if response.imgURLList.count != 0 {
            foodImageView.isHidden = false
            foodImageView.kfSetImage(url: response.imgURLList[0])
        } else {
            foodImageView.isHidden = true
        }
        sideButton.setImage(ImageLiteral.greySideButton, for: .normal)
        sideButton.setTitle("", for: .normal)
    }
}
