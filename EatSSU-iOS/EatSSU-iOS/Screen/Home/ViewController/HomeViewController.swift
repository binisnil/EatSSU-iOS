//
//  ViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/02/13.
//

import UIKit

import Pageboy
import SnapKit
import Tabman

class HomeViewController: TabmanViewController {

    // MARK: - Properties
    
    let realm = RealmService()
    var isPreview = false
    
    // MARK: - UI Components
    
    let morningView = MorningView()
    let lunchView = LunchView()
        
    private let contentView = UIView()
    public let bar = TMBar.ButtonBar()

    var dateSelectedField = UITextField().then {
        $0.tintColor = .clear
        $0.textColor = .darkGray
        $0.font = .boldSystemFont(ofSize: 18)
    }

    let datePicker = UIDatePicker().then {
        $0.addTarget(self, action: #selector(didSelectedDate(_:)), for: .valueChanged)
    }

    var viewControllers: Array<UIViewController> = [MorningViewController(), LunchViewController(), DinnerViewController()]

    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        settingTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .top)

        self.view.backgroundColor = .systemBackground
        setnavigation()
        self.configureUI()
        self.setLayout()

        self.createDatePicker()

        // 초기 날짜 표시
        self.setTodayDateLabel(with: Date())
               
    }
    
    func configureUI() {
        view.addSubviews(dateSelectedField)
    }

    func setLayout() {
        dateSelectedField.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(114)
            $0.height.equalTo(20)
        }
        
        bar.snp.makeConstraints {
            $0.top.equalTo(dateSelectedField.snp.bottom).offset(3)
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
       }
    }

    func setnavigation() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "TopLogo"))
        navigationController?.isNavigationBarHidden = false
        if isPreview {
            let rightButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(didTappedRightBarButton))
            rightButton.tintColor = UIColor.primary
            navigationItem.rightBarButtonItem = rightButton
        } else {
            navigationItem.hidesBackButton = true
        }
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.tintColor = .primary

        dateSelectedField.inputView = datePicker
    }

    func setTodayDateLabel(with date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        dateSelectedField.text = formatter.string(from: date)
    }
    
    @objc
    func didTappedRightBarButton() {
        // 마이페이지 뷰로 이동
        let nextVC = MyPageViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    // FIXME: date 전달
    @objc func didSelectedDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateSelectedField.text = dateFormatter.string(from: sender.date)
//        dateFormatter.dateFormat = "yyyyMMdd"
//        let dailyDate = dateFormatter.string(from: sender.date)
        view.endEditing(true)
        
//        lunchView.getDailyLunchMenuTable(date: dailyDate, restaurant: "DODAM", tableView: lunchView.dodamTableView)
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
    
    func isPreviewButtonTapped(preview: Bool) {
        isPreview = preview
    }
}
