//
//  MorningViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import SnapKit
import Then

class MorningViewController: BaseViewController {
    
    //MARK: - UI Components
    
    private let contentView = UIView()
    private let morningView = MorningView()
    
    lazy var menuItems: [UIAction] = {
        return [
            UIAction(title: "마이페이지",
                     image: UIImage(systemName: "person"),
                     handler: {_ in self.touchMyPageBtnEvent()})
        ]
    }()

    lazy var menu : UIMenu = {
        let menu = UIMenu(title: "title",
                          image: UIImage(systemName: "bell"),
                          identifier: nil,
                          options: .displayInline,
                          children: menuItems)
       return menu
    }()
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setnavigation()
    }
    
    //MARK: - Functions
    
    func setnavigation() {
        self.navigationController?.navigationBar.topItem?.title = "EAT SSU"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 25), .foregroundColor: UIColor.primary]
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "text.justify", style: .done, target: self, action: #selector(rightBarItemTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "",
                                                                   image: UIImage(systemName: "text.justify"),
                                                                   primaryAction: nil,
                                                                   menu: menu)
    }
    
    override func configureUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(morningView)
    }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.height.equalToSuperview()
        }
        
        morningView.snp.makeConstraints {
            $0.width.height.equalTo(contentView)
        }
    }
    
    @objc
    func tappedRightBarItem() {
        print("tappedRightBarItem")
    }
    
    @objc
    func tappedMyPageBtn() {
        print("tappedMyPageBtn")
    }
}

