//
//  LoginViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/28.
//

import UIKit

import SnapKit
import Then

class LoginViewController : BaseViewController {
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let loginView = LoginView()
    
    lazy var previewButton = loginView.previewButton.then() {
        $0.addTarget(self, action: #selector(didTappedPreviewBtn), for: .touchUpInside)
        $0.backgroundColor = .purple
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Function
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubviews(loginView)
    }
    
    override func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
       
        
    }
    
    @objc func didTappedPreviewBtn() {
        print("didTappedPreviewBtn")
    }
        
        override func setButtonEvent() {
            
            
        }
        
        
    }

