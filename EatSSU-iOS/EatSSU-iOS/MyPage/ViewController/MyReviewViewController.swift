//
//  MyReviewViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/27.
//

import SnapKit
import Then

class MyReviewViewController: BaseViewController {
    
    // MARK: - UI Components
    
    let myReviewView = MyReviewView()
    
    // MARK: - Functions
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = TextLiteral.myReview
    }
    
    override func configureUI() {
        
    }
    
    override func setLayout() {
        
    }
    
}
