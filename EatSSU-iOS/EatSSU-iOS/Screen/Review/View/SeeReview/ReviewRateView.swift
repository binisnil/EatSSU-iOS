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

    var totalRate: Double = 0 ///dummy
    
    // MARK: - UI Components
    
//    private let reviewLabel: UILabel = {
//        let label = UILabel()
//        label.text = "리뷰"
//        label.font = .bold(size: 22)
//        label.textColor = .black
//        return label
//    }()
//
//    private let progressView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .primary
//        return view
//    }()
    
    private var menuLabel: UILabel = {
        let label = UILabel()
        label.text = "김치볶음밥 & 계란국"
        label.font = .semiBold(size: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let bigStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "starFilledBig.svg")
        return imageView
    }()
    
    private let rateNumLabel: UILabel = {
        let label = UILabel()
        label.text = "4.3"
        label.font = .bold(size: 36)
        label.textColor = .black
        return label
    }()
    
    private let tasteStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "starFilled.svg")
        return imageView
    }()
    
    private let quantityStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "starFilled.svg")
        return imageView
    }()
    
    private let tasteLabel: UILabel = {
        let label = UILabel()
        label.text = "맛"
        label.font = .bold(size: 14)
        label.textColor = .black
        return label
    }()
    
    private let tasteRateLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = .bold(size: 14)
        label.textColor = .primary
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "양"
        label.font = .bold(size: 14)
        label.textColor = .black
        return label
    }()
    
    private let quantityRateLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = .bold(size: 14)
        label.textColor = .primary
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
        view.backgroundColor = .gray300
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        return view
    }()
    
    var twoChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray300
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        return view
    }()
    
    var threeChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray300
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        return view
    }()
    
    var fourChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray300
        view.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        return view
    }()
    
    var fiveChartBar: UIView = {
        let view = UIView()
        view.backgroundColor = .gray300
        return view
    }()
    
    lazy var yAxisStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fivePointLabel,
                                                       fourPointLabel,
                                                       threePointLabel,
                                                       twoPointLabel,
                                                       onePointLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .trailing
        return stackView
    }()
    
    lazy var totalLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalReviewLabel,
                                                       totalReviewCount])
        stackView.axis = .horizontal
        stackView.spacing = 7
        return stackView
    }()
    
    lazy var totalRateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bigStarImageView
                                                       , rateNumLabel])
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .top
        return stackView
    }()
    
    lazy var tasteStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [tasteLabel,
                                                      tasteStarImageView,
                                                      tasteRateLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var quantityStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [quantityLabel,
                                                      quantityStarImageView,
                                                      quantityRateLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
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
    
    // MARK: FIX ME - charts 추가 나중에 하기
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        self.addSubviews(
//            reviewLabel,
//                         progressView,
                         menuLabel,
                         totalRateStackView,
                         addReviewButton,
                         totalLabelStackView,
                         yAxisStackView,
                         oneChartBar,
                         twoChartBar,
                         threeChartBar,
                         fourChartBar,
                         fiveChartBar,
                         tasteStackView,
                         quantityStackView)
    }
    
    override func setLayout() {
        menuLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.centerX.equalToSuperview()
            make.width.equalTo(290)
        }
        
        totalRateStackView.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().inset(60)
        }
        
        tasteStackView.snp.makeConstraints { make in
            make.top.equalTo(totalRateStackView.snp.bottom).offset(8)
            make.leading.equalTo(totalRateStackView).offset(-5)
        }
        
        quantityStackView.snp.makeConstraints { make in
            make.top.equalTo(tasteStackView)
            make.leading.equalTo(tasteStackView.snp.trailing).offset(5)
        }
        
        yAxisStackView.snp.makeConstraints { make in
            make.top.equalTo(totalReviewLabel.snp.bottom).offset(8)
            make.leading.equalTo(totalReviewLabel)
        }
        
        oneChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(onePointLabel)
            make.leading.equalTo(onePointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
        }
        
        twoChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(twoPointLabel)
            make.leading.equalTo(twoPointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
        }
        
        threeChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(threePointLabel)
            make.leading.equalTo(threePointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
        }
        
        fourChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(fourPointLabel)
            make.leading.equalTo(fourPointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
        }
        
        fiveChartBar.snp.makeConstraints { make in
            make.centerY.equalTo(fivePointLabel)
            make.leading.equalTo(fivePointLabel.snp.trailing).offset(7)
            make.height.equalTo(10)
        }
        
        addReviewButton.snp.makeConstraints { make in
            make.top.equalTo(tasteStackView.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(36)
            make.trailing.equalToSuperview().offset(-36)
            make.height.equalTo(30)
        }
        
        totalLabelStackView.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(15)
            make.leading.equalTo(quantityStackView.snp.trailing).offset(44)
        }
        
        tasteStarImageView.snp.makeConstraints { make in
            make.height.equalTo(11.19)
            make.width.equalTo(11.71)
        }
        
        quantityStarImageView.snp.makeConstraints { make in
            make.height.equalTo(11.19)
            make.width.equalTo(11.71)
        }
    }
    
}

extension ReviewRateView {
    func dataBind(menuName: [String], reviewCount: Int, totalGrade: Double, tasteGrade: Double, amountGrade: Double, fiveCnt: Int, fourCnt: Int, threeCnt: Int, twoCnt: Int, oneCnt: Int) {
        menuLabel.text = menuName.joined(separator: ", ")
        totalReviewCount.text = "\(reviewCount)"
        let total = String(format: "%.1f", totalGrade)
        rateNumLabel.text = "\(total)"
        totalRate = totalGrade
        tasteRateLabel.text = "\(tasteGrade)"
        quantityRateLabel.text = "\(amountGrade)"
        
        fiveChartBar.snp.makeConstraints {
            if fiveCnt == 0 {
                $0.width.equalTo(0)
            } else {
                $0.width.equalTo(126/reviewCount*fiveCnt)
            }
        }
        fourChartBar.snp.makeConstraints {
            if fourCnt == 0 {
                $0.width.equalTo(0)
            } else {
                $0.width.equalTo(126/reviewCount*fourCnt)
            }
        }
        threeChartBar.snp.makeConstraints {
            if threeCnt == 0 {
                $0.width.equalTo(0)
            } else {
                $0.width.equalTo(126/reviewCount*threeCnt)
            }
        }
        twoChartBar.snp.makeConstraints {
            if twoCnt == 0 {
                $0.width.equalTo(0)
            } else {
                $0.width.equalTo(126/reviewCount*twoCnt)
            }
        }
        oneChartBar.snp.makeConstraints {
            if oneCnt == 0 {
                $0.width.equalTo(0)
            } else {
                $0.width.equalTo(126/reviewCount*oneCnt)
            }
        }
    }
}
