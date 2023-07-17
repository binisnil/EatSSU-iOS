//
//  HomeTabmanController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/16.
//

import UIKit

import SnapKit
import Tabman
import Pageboy

class HomeTabmanController: TabmanViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    let bar = TMBar.ButtonBar()
    private var viewControllers = [MorningViewController(), LunchViewController(), DinnerViewController()]
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTabBar()
    }
 
    //MARK: - Functions
    
    func registerTabBar() {
        self.dataSource = self
        
        setLayoutTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .top)
    }
}

// MARK: - PageBoy Extension

extension HomeTabmanController: PageboyViewControllerDataSource, TMBarDataSource {
    
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
