//
//  LoginViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/28.
//

import UIKit

import SnapKit
import Then

class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let loginView = LoginView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonEvent()
    }
    
    // MARK: - Function
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubviews(loginView)
    }
    
    override func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        loginView.previewButton.addTarget(self, action: #selector(didTappedPreviewBtn), for: .touchUpInside)
        loginView.signUPButton.addTarget(self, action: #selector(didTappedSignUpBtn), for: .touchUpInside)
    }
    
    @objc
    func didTappedPreviewBtn() {
        let nextVC = HomeViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    func didTappedSignUpBtn() {
        let nextVC = SignUpViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

