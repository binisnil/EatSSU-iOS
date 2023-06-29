//
//  setRateViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/23.
//

import UIKit

import SnapKit
import Then

class SetRateViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var rateView = RateView()
    private var tasteRateView = RateView()
    private var quantityRateView = RateView()
    
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
        label.text = "김치볶음밥 & 계란국을 추천하시겠어요?"
        label.font = .bold(size: 20)
        label.textColor = .black
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "해당 메뉴에 대한 상세한 평가를 남겨주세요."
        label.font = .medium(size: 16)
        label.textColor = .gray700
        return label
    }()
    
    private var tasteLabel: UILabel = {
        let label = UILabel()
        label.text = "맛"
        label.font = .bold(size: 20)
        label.textColor = .black
        return label
    }()
    
    private var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "양"
        label.font = .bold(size: 20)
        label.textColor = .black
        return label
    }()
    
    lazy var tasteStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 65
        $0.alignment = .center
    }
    
    lazy var quantityStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 65
        $0.alignment = .center
    }
    
    lazy var detailRateStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.alignment = .center
    }
    
    private let userReviewTextView: UITextView = {
        let textView = UITextView()
        textView.font = .medium(size: 16)
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .background
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        return textView
    }()
    
    private let maximumWordLabel: UILabel = {
        let label = UILabel()
        label.text = "최대 300자"
        label.font = .medium(size: 12)
        label.textColor = .gray700
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }

    // MARK: - Functions
    
    override func configureUI() {
        dismissKeyboard()
        view.addSubviews(rateView,
                         menuLabel,
                         nextButton,
                         tasteLabel,
                         quantityLabel,
                         detailRateStackView,
                         userReviewTextView,
                         maximumWordLabel)
        
        tasteStackView.addArrangedSubviews([tasteLabel,
                                            tasteRateView])
        
        quantityStackView.addArrangedSubviews([quantityLabel,
                                               quantityRateView])
        
        detailRateStackView.addArrangedSubviews([detailLabel,
                                                 tasteStackView,
                                                 quantityStackView])
    }
    
    override func setLayout() {
        menuLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.centerX.equalToSuperview()
        }
        
        rateView.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
        }
        
        detailRateStackView.snp.makeConstraints { make in
            make.top.equalTo(rateView.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        nextButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).inset(27)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        
        for i in 0...4 {
            tasteRateView.buttons[i].snp.makeConstraints { make in
                make.height.equalTo(28)
                make.width.equalTo(29.3)
            }
            
            quantityRateView.buttons[i].snp.makeConstraints { make in
                make.height.equalTo(28)
                make.width.equalTo(29.3)
            }
        }
        
        userReviewTextView.snp.makeConstraints { make in
            make.top.equalTo(detailRateStackView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(181)
        }
        
        maximumWordLabel.snp.makeConstraints { make in
            make.top.equalTo(userReviewTextView.snp.bottom).offset(7)
            make.trailing.equalTo(userReviewTextView)
        }
    }
    
    override func setButtonEvent() {
        nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
    }
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = "리뷰 남기기"
    }
    
    // FIXME: - alert 추가
    
    @objc
    func tappedNextButton() {
        if let reviewViewController = self.navigationController?.viewControllers.first(where: { $0 is ReviewViewController }) {
            self.navigationController?.popToViewController(reviewViewController, animated: true)
        }
    }
    
    // 키보드가 나타났다는 알림을 받으면 실행할 메서드
    @objc func keyboardWillShow(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 올려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let buttonHeight = nextButton.frame.size.height + 77
            self.view.frame.origin.y -= (keyboardHeight - buttonHeight)
        }
    }

    // 키보드가 사라졌다는 알림을 받으면 실행할 메서드
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 내려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let buttonHeight = nextButton.frame.size.height + 77
            self.view.frame.origin.y += (keyboardHeight - buttonHeight)
        }
    }
    
    // 노티피케이션을 추가하는 메서드
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
