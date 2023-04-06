//
//  WriteReviewViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/25.
//

import UIKit

class WriteReviewViewController: BaseViewController {
    
    // MARK: - Properties
    
    var personalRate = 0
    private var starButtons: [UIButton] = []
    
    // MARK: - UI Component
    
    private var menuLabel: UILabel = {
        let label = UILabel()
        label.text = "김치볶음밥 & 계란국을 평가해주세요"
        label.font = .bold(size: 20)
        label.textColor = .black
        return label
    }()
    
    lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 9
        stackView.backgroundColor = .systemBackground
        return stackView
    }()
    
    private lazy var starFillImage: UIImage? = {
        return UIImage(named: "starFilledBig.svg")
    }()
    
    private lazy var starEmptyImage: UIImage? = {
        return UIImage(named: "starEmptyBig.svg")
    }()
    
    private let userReviewTextView: UITextView = {
        let textView = UITextView()
        textView.font = .medium(size: 16)
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .backgroundGray
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        return textView
    }()
    
    private let maximumWordLabel: UILabel = {
        let label = UILabel()
        label.text = "최대 150자"
        label.font = .medium(size: 12)
        label.textColor = .mediumGray
        return label
    }()
    
    private var updateReviewButton: UIButton = {
        let button = UIButton()
        button.setTitle("리뷰 등록하기", for: .normal)
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
        setStarButtons()
        
        userReviewTextView.delegate = self
    }
    
    // MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(menuLabel,
                         starStackView,
                         userReviewTextView,
                         maximumWordLabel,
                         updateReviewButton)
    }
    
    override func setLayout() {
        menuLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.centerX.equalToSuperview()
        }
                
        starStackView.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(11)
            make.centerX.equalToSuperview()
        }
        
        userReviewTextView.snp.makeConstraints { make in
            make.top.equalTo(starStackView.snp.bottom).offset(33)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(181)
        }
        
        maximumWordLabel.snp.makeConstraints { make in
            make.top.equalTo(userReviewTextView.snp.bottom).offset(7)
            make.trailing.equalTo(userReviewTextView)
        }
        
        updateReviewButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-61)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }
    
    override func setButtonEvent() {
        updateReviewButton.addTarget(self, action: #selector(userTappedNextButton), for: .touchUpInside)
    }
    
    // FIXME: - TextView placeholder 커스텀 수정
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.userReviewTextView.resignFirstResponder()
        }
    
    func customNavigationBar() {
        let backButton: UIBarButtonItem = UIBarButtonItem()
        backButton.title = ""
        navigationItem.title = "리뷰 남기기"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = .primary
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.primary, NSAttributedString.Key.font: UIFont.bold(size: 22)]
    }
    
    func setStarButtons() {
        for i in 0...personalRate - 1 {
            let button = UIButton()
            button.setImage(starFillImage, for: .normal)
            button.snp.makeConstraints { make in
                make.height.equalTo(23.88)
                make.width.equalTo(24.99)
            }
            button.tag = i
            starButtons += [button]
            starStackView.addArrangedSubview(button)
        }
        
        for i in personalRate..<5 {
            let button = UIButton()
            button.setImage(starEmptyImage, for: .normal)
            button.snp.makeConstraints { make in
                make.height.equalTo(23.88)
                make.width.equalTo(24.99)
            }
            button.tag = i
            starButtons += [button]
            starStackView.addArrangedSubview(button)
        }
    }
    
    @objc func userTappedNextButton() {
        if let reviewViewController = self.navigationController?.viewControllers.first(where: { $0 is ReviewViewController }) {
            self.navigationController?.popToViewController(reviewViewController, animated: true)
        }
    }
}

extension WriteReviewViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = userReviewTextView.text.count - range.length + text.count
        if newLength > 150 {
          return false
        }
        return true
    }
}
