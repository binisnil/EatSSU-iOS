//
//  HomeViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/15.
//

import UIKit

import SnapKit
import Tabman

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    var isPreview = true
    var currentDate: Date = Date() {
        didSet {
            tabmanController.morningViewController.morningMenuAPI(date: changeDateFormat(date: currentDate))
            tabmanController.lunchViewController.lunchMenuAPI(date: changeDateFormat(date: currentDate))
            tabmanController.dinnerViewController.dinnerMenuAPI(date: changeDateFormat(date: currentDate))
        }
    }
    
    // MARK: - UI Components
    
    let tabmanController = HomeTabmanController()
    let homeCalendarView = HomeCalendarView()
        
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        homeCalendarView.delegate = self
        
        registerTabman()
        setnavigation()
        configureUI()
        setLayout()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        tabmanController.morningViewController.morningMenuAPI(date: changeDateFormat(date: currentDate))
        tabmanController.lunchViewController.lunchMenuAPI(date: changeDateFormat(date: currentDate))
        tabmanController.dinnerViewController.dinnerMenuAPI(date: changeDateFormat(date: currentDate))
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(homeCalendarView)
    }

    override func setLayout() {
        homeCalendarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
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

        // 자식 뷰를 부모 뷰에 추가
        view.addSubview(tabmanController.view)
        
        // tabman 레이아웃 설정
        tabmanController.view.snp.makeConstraints {
            $0.top.equalTo(homeCalendarView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        // 자식 뷰 컨트롤러로서의 위치를 확정
        tabmanController.didMove(toParent: self)
    }
    
    func changeDateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
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

// MARK: Calendar Selection
extension HomeViewController: CalendarSeletionDelegate {

    func didSelectCalendar(date: Date) {
        self.currentDate = date
    }
}
