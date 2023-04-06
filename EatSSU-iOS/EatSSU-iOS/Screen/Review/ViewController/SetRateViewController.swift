//
//  setRateViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/23.
//

import UIKit

import SnapKit

class SetRateViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var bottomTagView = BottomTagView()
    private var rateView = RateView()
    private var selectedButtonCount = 0
    
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
    
    private var menuLabel: UILabel = {
        let label = UILabel()
        label.text = "김치볶음밥 & 계란국을 평가해주세요"
        label.font = .bold(size: 20)
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
    
    private var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음 단계로", for: .normal)
        button.backgroundColor = .primary
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .semiBold(size: 18)
        return button
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(rateView,
                         bottomTagView,
                         menuLabel,
                         introLabel,
                         nextButton)
    }
    
    override func setLayout() {
        introLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(125)
            make.centerX.equalToSuperview()
        }
        
        menuLabel.snp.makeConstraints { make in
            make.top.equalTo(introLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        rateView.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
        
        bottomTagView.snp.makeConstraints { make in
            make.top.equalTo(rateView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-68)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }
    
    override func setButtonEvent() {
        nextButton.addTarget(self, action: #selector(userTapNextButton), for: .touchUpInside)
        [bottomTagView.tag1,
         bottomTagView.tag2,
         bottomTagView.tag3,
         bottomTagView.tag4,
         bottomTagView.tag5,
         bottomTagView.tag6,
         bottomTagView.tag7,
         bottomTagView.tag8,
         bottomTagView.tag9,
         bottomTagView.tag10].forEach {
            $0.addTarget(self, action: #selector(isTagTapped), for: .touchUpInside)
        }
    }
    
    func customNavigationBar() {
        navigationController?.navigationBar.tintColor = .primary
        navigationController?.navigationBar.barTintColor = .white
        let backButton: UIBarButtonItem = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationItem.title = "리뷰 남기기"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.primary, NSAttributedString.Key.font: UIFont.bold(size: 22)]
    }
    
    // FIXME: - 별점 안남기면 버튼 안넘어가도록 수정 (alert 추가)
    
    @objc
    func userTapNextButton() {
        if selectedButtonCount != 0 {
            let nextVC = WriteReviewViewController()
            nextVC.personalRate = rateView.currentStar
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    @objc
    func isTagTapped(_ sender: UIButton) {
        if sender.layer.borderColor == UIColor.black.cgColor {
            if selectedButtonCount < 3 {
                sender.layer.borderColor = UIColor.primary.cgColor
                sender.layer.borderWidth = 1.5
                selectedButtonCount += 1
            }
        } else {
            selectedButtonCount -= 1
            sender.layer.borderColor = UIColor.black.cgColor
            sender.layer.borderWidth = 0.5
        }
    }
}
