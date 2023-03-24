//
//  ReviewViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/04.
//

import Foundation
import UIKit

import Charts

class ReviewViewController: BaseViewController {
    
    //MARK: - UI Component
    
    let topReviewView = ReviewRateView()
    
    //MARK: - Function

    override func configureUI() {
        view.backgroundColor = .backgroundGray
        topReviewView.backgroundColor = .white
        view.addSubviews(topReviewView)
    }
    
    override func setLayout() {
        topReviewView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(350)
        }
    }
    
    override func setButtonEvent() {
        topReviewView.addReviewButton.addTarget(self, action: #selector(userTapReviewButton), for: .touchUpInside)
    }
    
    @objc func userTapReviewButton() {
        let nextVC = SetRateViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
