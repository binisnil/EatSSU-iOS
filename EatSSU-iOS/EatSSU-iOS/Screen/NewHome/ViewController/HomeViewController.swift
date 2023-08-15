//
//  HomeViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/08/08.
//
import UIKit

import Moya
import SnapKit

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
            
    var currentDate: Date = Date() {
        didSet {
            print("Changed Date: \(currentDate)")
        }
    }
    
    // MARK: - UI Components
    
    let tabmanController = HomeTimeTabmanController()
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
    
    // MARK: - Functions
    
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
            let rightButton = UIBarButtonItem(image: ImageLiteral.myPageIcon, style: .plain, target: self, action: #selector(didTappedRightBarButton))
            navigationItem.rightBarButtonItem = rightButton
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
    
    @objc
    func didTappedRightBarButton() {
        let nextVC = MyPageViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

// MARK: Calendar Selection
extension HomeViewController: CalendarSeletionDelegate {
    func didSelectCalendar(date: Date) {
        self.currentDate = date
    }
}
