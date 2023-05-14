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
    let alertDeclarationLabel = UILabel().then {
        $0.text = "리뷰를 신고하는 이유를 선택해주세요."
    }
    
    let sendButton = MainButton().then {
        $0.title = "EAT SSU에게 보내기"
    }
    
    let report1Label = UILabel().then {
        $0.text = "메뉴와 관련없는 내용"
    }

    let report2Label = UILabel().then {
        $0.text = "음란성, 욕설 등 부적절한 내용"
    }
    
    let report3Label = UILabel().then {
        $0.text = "부적절한 홍보 또는 광고"
    }
    
    let report4Label = UILabel().then {
        $0.text = "리뷰 작성 취지에 맞지 않는 내용 (복사글 등)"
    }
    
    let report5Label = UILabel().then {
        $0.text = "저작권 도용 의심 (사진 등)"
    }
    
    let report6Label = UILabel().then {
        $0.text = "기타 (하단 내용 작성)"
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
                         sendButton)
        
    }
    
    override func setLayout() {
        alertDeclarationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(107)
            $0.leading.equalToSuperview().offset(16)
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
