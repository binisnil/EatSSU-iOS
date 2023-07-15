//
//  NewHomeViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/15.
//

import UIKit

import SnapKit

class NewHomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    var isPreview = true
    
    // MARK: - UI Components
    
    var tabmanContainerView = UIView()
    let tabmanController = HomeTabmanController()
    let homeCalendarView = HomeCalendarView()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setnavigation()
        configureUI()
        setLayout()
        registerTabman()
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(homeCalendarView,
                         tabmanContainerView)
    }

    override func setLayout() {
        homeCalendarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        tabmanContainerView.snp.makeConstraints {
            $0.top.equalTo(homeCalendarView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func setnavigation() {
            navigationItem.titleView = UIImageView(image: ImageLiteral.EatSSULogo)
            navigationController?.isNavigationBarHidden = false
            if isPreview {
                let rightButton = UIBarButtonItem(image: ImageLiteral.myPageIcon, style: .plain, target: self, action: #selector(didTappedRightBarButton))
                rightButton.tintColor = .primary
                navigationItem.rightBarButtonItem = rightButton
            } else {
                navigationItem.hidesBackButton = true
            }
        }
    
    func registerTabman() {
        // 자식 뷰 컨트롤러로 추가
        addChild(tabmanController)
       
        tabmanController.view.frame = tabmanContainerView.bounds
        tabmanContainerView.addSubview(tabmanController.view)
       
        // 자식 뷰 컨트롤러로서의 위치를 확정
        tabmanController.didMove(toParent: self)
    }

    @objc
    func didTappedRightBarButton() {
        let nextVC = MyPageViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func isPreviewButtonTapped(preview: Bool) {
        isPreview = preview
    }
}
