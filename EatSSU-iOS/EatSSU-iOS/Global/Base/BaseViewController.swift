//
//  BaseViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/15.
//

import UIKit

import Moya
import SnapKit

class BaseViewController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Function
    
    func configureUI() {
        //override Point
        view.backgroundColor = .systemBackground
    }
    
    func setLayout() {
        //override Point
    }
    
    func setButtonEvent() {
        //override Point
    }
}

