//
//  MyReviewView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/27.
//

import UIKit

import SnapKit
import Then

class MyReviewView: BaseUIView {
    
    // MARK: - UI Components
    
    let myReviewTableView = UITableView()
    
    // MARK: - Functions
    
    override func configureUI() {
        self.addSubview(myReviewTableView)
        
        myReviewTableView.do {
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
        }
    }

    override func setLayout() {
        myReviewTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
