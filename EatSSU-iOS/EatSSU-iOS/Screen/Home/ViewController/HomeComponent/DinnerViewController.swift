//
//  DinnerViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import SnapKit

class DinnerViewController: BaseViewController {
    
    //MARK: - UI Components
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(scrollView)
    }
    
    override func setLayout() {
        
    }
    
    override func setButtonEvent() {
        
    }
}

