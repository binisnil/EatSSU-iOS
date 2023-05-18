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
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Functions
    
    func configureUI() {
        //override Point
    }
    
    func setLayout() {
        //override Point
    }
    
    func setButtonEvent() {
        //override Point
    }
    
//    func customNavigationBar() {
//            navigationController?.navigationBar.tintColor = .primary
//            navigationController?.navigationBar.barTintColor = .white
//            
//            let backButton: UIBarButtonItem = UIBarButtonItem()
//            backButton.title = ""
//            navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//            
//            navigationItem.title = "회원가입"
//            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.primary, NSAttributedString.Key.font: UIFont.bold(size: 22)]
//        }
}

