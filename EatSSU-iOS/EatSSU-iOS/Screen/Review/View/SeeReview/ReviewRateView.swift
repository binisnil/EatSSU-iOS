//
//  ReviewRateView.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/15.
//
import UIKit

import SnapKit

class ReviewRateView: BaseUIView {
    
    // MARK: - Properties

    var currentStar: Int = 0
    private var starButtons: [UIButton] = []
    
    // MARK: - UI Components
    
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
    
    private let menuLabel: UILabel = {
        let label = UILabel()
        label.text = "김치볶음밥 & 계란국"
        label.font = .semiBold(size: 20)
        label.textColor = .black
        return label
    }()
    
    private let rateNumLabel: UILabel = {
        let label = UILabel()
        label.text = "4.3"
        label.font = .bold(size: 30)
        label.textColor = .black
        return label
    }()
    
    private let totalReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "총 리뷰 수"
        label.font = .bold(size: 14)
        label.textColor = .black
        return label
    }()
    
    private let totalReviewCount: UILabel = {
        let label = UILabel()
        label.text = "15"
        label.font = .bold(size: 14)
        label.textColor = .primary
        return label
    }()
    
    private let fivePointLabel: UILabel = {
        let label = UILabel()
        label.text = "5점"
        label.font = .medium(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let fourPointLabel: UILabel = {
        let label = UILabel()
        label.text = "4점"
        label.font = .medium(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let threePointLabel: UILabel = {
        let label = UILabel()
        label.text = "3점"
        label.font = .medium(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let twoPointLabel: UILabel = {
        let label = UILabel()
        label.text = "2점"
        label.font = .medium(size: 12)
        label.textColor = .black
        return label
    }()
    
    private let onePointLabel: UILabel = {
        let label = UILabel()
        label.text = "1점"
        label.font = .medium(size: 12)
        label.textColor = .black
        return label
    }()
    
    var oneChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .mediumGray
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        return view
    }()
    
    var twoChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .mediumGray
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        return view
    }()
    
    var threeChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .mediumGray
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        return view
    }()
    
    var fourChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .mediumGray
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        return view
    }()
    
    var fiveChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .mediumGray
        return view
    }()
    
    lazy var yAxisStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fivePointLabel, fourPointLabel, threePointLabel, twoPointLabel, onePointLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .trailing
        return stackView
    }()
    
    lazy var totalLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalReviewLabel, totalReviewCount])
        stackView.axis = .horizontal
        stackView.spacing = 7
        return stackView
    }()
    
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
    
    let addReviewButton: UIButton = {
        let button = UIButton()
        button.setTitle("리뷰 작성하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .medium(size: 16)
        button.backgroundColor = .primary
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = false
        return button
    }()
    
    //MARK: FIX ME - charts 추가 나중에 하기
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStarButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        [oneChartBar, twoChartBar, threeChartBar, fourChartBar, fiveChartBar].forEach {
            $0.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        }
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(reviewLabel,
                         progressView,
                         menuLabel,
                         rateNumLabel,
                         starStackView,
                         addReviewButton,
                         totalLabelStackView,
                         yAxisStackView,
                         oneChartBar,
                         twoChartBar,
                         threeChartBar,
                         fourChartBar,
                         fiveChartBar)
    }
    
    override func setLayout() {
        reviewLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.centerX.equalToSuperview()
        }

        progressView.snp.makeConstraints { make in
            make.top.equalTo(reviewLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(2)

        }

        menuLabel.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        rateNumLabel.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(40)
            make.centerX.equalTo(starStackView)
        }
        
        starStackView.snp.makeConstraints { make in
            make.top.equalTo(rateNumLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(36)
        }
        
        yAxisStackView.snp.makeConstraints { make in
            make.top.equalTo(totalReviewLabel.snp.bottom).offset(8)
            make.leading.equalTo(totalReviewLabel)
        }
        
        oneChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(onePointLabel)
            make.leading.equalTo(onePointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
            make.width.equalTo(126)
        }
        
        twoChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(twoPointLabel)
            make.leading.equalTo(twoPointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
            make.width.equalTo(126)
        }
        
        threeChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(threePointLabel)
            make.leading.equalTo(threePointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
            make.width.equalTo(126)
        }
        
        fourChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(fourPointLabel)
            make.leading.equalTo(fourPointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
            make.width.equalTo(126)
        }
        
        fiveChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(fivePointLabel)
            make.leading.equalTo(fivePointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
            make.width.equalTo(126)
        }
        
        addReviewButton.snp.makeConstraints { make in
            make.top.equalTo(starStackView.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(36)
            make.trailing.equalToSuperview().offset(-36)
            make.height.equalTo(30)
        }
        
        totalLabelStackView.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(15)
            make.leading.equalTo(starStackView.snp.trailing).offset(24)
        }
    }
    
    func setStarButtons(){
        for i in 0..<5 {
            let button = UIButton()
            button.setImage(starFillImage, for: .normal)
            button.tag = i
            starButtons += [button]
            starStackView.addArrangedSubview(button)
        }
    }
}
