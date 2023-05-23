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
    
    lazy private(set) var className: String = {
      return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    // MARK: - Initializing
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT: \(className)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Functions
    
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


