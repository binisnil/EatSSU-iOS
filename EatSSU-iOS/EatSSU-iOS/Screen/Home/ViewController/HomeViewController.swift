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
    
    // MARK: - Properties
        
    public let bar = TMBar.ButtonBar()
    var viewControllers: Array<UIViewController> = [MorningViewController(),LunchViewController(),DinnerViewController()]
    
    var dateTextField = UITextField().then {
        $0.borderStyle = .roundedRect
    }
    
    var todayDatePicker = UIDatePicker().then {
        $0.preferredDatePickerStyle = .automatic
        $0.datePickerMode = .date
        $0.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        settingTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .top)
        
        view.backgroundColor = .systemBackground
        setnavigation()
        configureUI()
        setLayout()
        
        dateTextField.frame = CGRect(x: 20, y: 100, width: self.view.frame.width - 40, height: 40)
        // TextField의 입력 뷰로 DatePicker 설정
        dateTextField.inputView = todayDatePicker
        
    }
    
    //MARK: - Functions
    
    func configureUI() {
        view.addSubview(dateTextField)
    }
    
    func setLayout() {
        dateTextField.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(navigationController!.navigationBar.frame.height)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)

        }
        bar.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom)
        }
    }
    
    func setnavigation() {
        self.navigationController?.navigationBar.topItem?.title = "EAT SSU"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 25), .foregroundColor: UIColor.primary]
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "text.justify", style: .done, target: self, action: #selector(rightBarItemTapped))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "",
//                                                                   image: UIImage(systemName: "text.justify"),
//                                                                   primaryAction: nil,
//                                                                   menu: menu)
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd"
            print(formatter.string(from: sender.date))
    }
    
    func setButtonEvent() {
        
        
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
            button.tintColor = .mediumGray
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 16)
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        ctBar.indicator.weight = .custom(value: 2)
        ctBar.indicator.tintColor = .primary
        ctBar.indicator.overscrollBehavior = .compress
        ctBar.layout.contentMode = .fit
        }
}
