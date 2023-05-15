//
//  DeclarationViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/15.
//

import UIKit

import SnapKit
import Then

class DeclarationViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    private let alertDeclarationLabel = UILabel().then {
        $0.text = "리뷰를 신고하는 이유를 선택해주세요."
        $0.font = .semiBold(size: 18)
    }
    
    private let report1Label = UILabel().then {
        $0.text = "메뉴와 관련없는 내용"
    }

    private let report2Label = UILabel().then {
        $0.text = "음란성, 욕설 등 부적절한 내용"
    }
    
    private let report3Label = UILabel().then {
        $0.text = "부적절한 홍보 또는 광고"
    }
    
    private let report4Label = UILabel().then {
        $0.text = "리뷰 작성 취지에 맞지 않는 내용 (복사글 등)"
    }
    
    private let report5Label = UILabel().then {
        $0.text = "저작권 도용 의심 (사진 등)"
    }
    
    private let report6Label = UILabel().then {
        $0.text = "기타 (하단 내용 작성)"
    }
    
    lazy var reportLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [report1Label, report2Label, report3Label, report4Label, report5Label, report6Label])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .leading
        return stackView
    }()
    
    private let userReportTextView: UITextView = {
        let textView = UITextView()
        textView.font = .medium(size: 16)
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .backgroundGray
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        return textView
    }()
    
    private let textLimitLabel = UILabel().then {
        $0.text = "최대 150자"
        $0.font = .medium(size: 12)
        $0.textColor = .blackGray
    }
    
    private let sendButton = MainButton().then {
        $0.title = "EAT SSU에게 보내기"
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        setLayout()
        setButtonEvent()
        customNavigationBar()
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(alertDeclarationLabel,
                         reportLabelStackView,
                         userReportTextView,
                         textLimitLabel,
                         sendButton
                         )
        
        [report1Label,report2Label,report3Label,report4Label,report5Label, report6Label].forEach {
            $0.font = .medium(size: 16)
            $0.textColor = .blackGray
        }
        
    }
    
    override func setLayout() {
        alertDeclarationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(107)
            $0.leading.equalToSuperview().offset(16)
        }
        reportLabelStackView.snp.makeConstraints {
            $0.top.equalTo(alertDeclarationLabel.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(16)
        }
        userReportTextView.snp.makeConstraints {
            $0.top.equalTo(reportLabelStackView.snp.bottom).offset(29)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(181)
        }
        textLimitLabel.snp.makeConstraints {
            $0.top.equalTo(userReportTextView.snp.bottom).offset(3)
            $0.trailing.equalToSuperview().inset(16)
        }
        sendButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-61)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        //override Point
    }
    
    func customNavigationBar() {
            navigationController?.navigationBar.tintColor = .primary
            navigationController?.navigationBar.barTintColor = .white
            
            let backButton: UIBarButtonItem = UIBarButtonItem()
            backButton.title = ""
            navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
            
            navigationItem.title = "신고하기"
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.primary, NSAttributedString.Key.font: UIFont.bold(size: 22)]
        }
}
