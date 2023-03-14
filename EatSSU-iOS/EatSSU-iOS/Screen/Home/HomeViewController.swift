//
//  ViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/02/13.
//

import UIKit
import Pageboy
import Tabman

class HomeViewController: TabmanViewController {

    //MARK: - Life Cycle
    
    var viewControllers: Array<UIViewController> = [MorningViewController(),LunchViewController(),DinnerViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()
        let bar = TMBar.ButtonBar()
        
        self.dataSource = self
        settingTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .top)
        
        view.backgroundColor = .systemBackground
    }
}

// MARK: - PageBoy Extension

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController,
                        at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
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
    
    func settingTabBar (ctBar: TMBar.ButtonBar) {
        ctBar.layout.transitionStyle = .snap
        ctBar.backgroundView.style = .blur(style: .light)
        ctBar.buttons.customize { (button) in
            button.tintColor = .gray1
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 16)
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        ctBar.indicator.weight = .custom(value: 2)
        ctBar.indicator.tintColor = .brandColor
        ctBar.indicator.overscrollBehavior = .compress
        ctBar.layout.contentMode = .fit
        }
}
