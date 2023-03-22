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
    
//    let topReviewView = ReviewRateView()
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
        
    }
    
//    func setViewShadow() {
//        topReviewView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        topReviewView.layer.shadowColor = UIColor.black.cgColor
//        topReviewView.layer.shadowOpacity = 0.9
//        topReviewView.layer.shadowRadius = 20
//        topReviewView.layer.masksToBounds = false
//        topReviewView.layer.rasterizationScale = UIScreen.main.scale
//    }
}
