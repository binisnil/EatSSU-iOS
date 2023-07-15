//
//  NewHomeViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/15.
//

import UIKit

import FSCalendar
import SnapKit
import Tabman
import Pageboy

class NewHomeViewController: TabmanViewController {
    
    // MARK: - Properties
    
    var isPreview = true
    
    // MARK: - UI Components
    
    let tabmanView = UIView()
    // FIXME: Corner 속성을 추가하면 bar와의 충돌로 view 나타나지 않음
//        $0.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20)
//        $0.layer.addBorder([.bottom], color: .gray300, width: 1.0)
    
    let bar = TMBar.ButtonBar()
    
    private var viewControllers = [MorningViewController(), LunchViewController(), DinnerViewController()]
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setnavigation()
        registerTabBar()
        configureUI()
        setLayout()
    }
    
    //MARK: - Functions
    
    func configureUI() {
        view.addSubview(tabmanView)
    }

    func setLayout() {
        tabmanView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
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
    
    func registerTabBar() {
        self.dataSource = self
        setLayoutTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .custom(view: tabmanView, layout: nil))
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

// MARK: - PageBoy Extension

extension NewHomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        nil
    }
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "아침")
        case 1:
            return TMBarItem(title: "점심")
        case 2:
            return TMBarItem(title: "저녁")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    func setLayoutTabBar(ctBar: TMBar.ButtonBar) {
        
        ctBar.backgroundColor = .white
        ctBar.backgroundView.style = .blur(style: .regular)
        ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        ctBar.buttons.customize { (button) in
            button.tintColor = .gray700 // 선택 안되어 있을 때
            button.selectedTintColor = .primary // 선택 되어 있을 때
            button.font = .semiBold(size: 16)
        }
        
        // 인디케이터 조정
        ctBar.indicator.weight = .custom(value: 2)
        ctBar.indicator.tintColor = .primary
        ctBar.indicator.overscrollBehavior = .compress
        ctBar.layout.contentMode = .fit
        ctBar.layout.transitionStyle = .snap
    }
    
}
