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
    private let contentView = UIView()
    let morningView = MorningView()
        
    var dateSelectedField = UITextField().then {
        $0.tintColor = .clear
        $0.textColor = .darkGray
        $0.font = .bold(size: 18)
    }
    
    let datePicker = UIDatePicker().then {
        $0.addTarget(self, action: #selector(didSelectedDate(_:)), for: .valueChanged)
    }
        
    public let bar = TMBar.ButtonBar()
    var viewControllers: Array<UIViewController> = [MorningViewController(),LunchViewController(),DinnerViewController()]
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    let label = UILabel().then {
        $0.text = "dfdffffffffffff"
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
        
        createDatePicker()
        
        // 초기 날짜 표시
        setTodayDateLabel(with: Date())
        
    }
    
    //MARK: - Functions
    
//    func configureUI() {
//        view.addSubviews(dateSelectedField,
//                        scrollView)
//        scrollView.addSubview(contentView)
//        contentView.addSubview(viewControllers)
//    }
//
//    func setLayout() {
//        dateSelectedField.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            $0.centerX.equalToSuperview()
//            $0.height.equalTo(30)
//
//        }
//        bar.snp.makeConstraints {
//            $0.top.equalTo(dateSelectedField.snp.bottom)
//            $0.bottom.equalTo(morningView.snp.top).inset(50)
//        }
//        scrollView.snp.makeConstraints {
//            $0.top.equalTo(bar.snp.bottom).offset(10)
//            $0.leading.bottom.trailing.equalToSuperview()
//        }
//        contentView.snp.makeConstraints {
//            $0.edges.width.equalTo(scrollView)
//        }
//
//
//    }
    //MARK: - Functions

    func configureUI() {
        view.addSubviews(dateSelectedField)
//        scrollView.addSubview(contentView)
//
//         // viewControllers
//        for vc in viewControllers {
//          // 부모 뷰 컨트롤러에 자식 뷰 컨트롤러를 추가
//            self.addChild(vc)
////
////            // contentView에 자식 뷰 컨트롤러의 뷰 추가
////            contentView.addSubview(vc.view)
//////
//////            // SnapKit 사용하여 레이아웃 설정
////            vc.view.snp.makeConstraints {
////                $0.width.height.equalToSuperview()
////            }
//            ㅡ.scrollView.snp.makeConstraints {
//                $0.top.equalTo(bar.snp.bottom)
//            }
//        }
        
    }

    func setLayout() {
        dateSelectedField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        bar.snp.makeConstraints {
            $0.top.equalTo(dateSelectedField.snp.bottom)
            $0.bottom.equalToSuperview().inset(210)
        }
//        scrollView.snp.makeConstraints {
//            $0.top.equalTo(bar.snp.bottom)
//            $0.leading.bottom.trailing.equalToSuperview()
//        }
//        contentView.snp.makeConstraints {
//            $0.edges.width.equalTo(scrollView)
//        }
    }
    
    func setnavigation() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "TopLogo"))
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(didTappedRightBarButton))
        rightButton.tintColor = UIColor.primary
        navigationItem.rightBarButtonItem = rightButton
        
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
    func didSelectedDate(_ sender: UIDatePicker) {
        print(sender.date)

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy.MM.dd"
        self.dateSelectedField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc
    func didTappedRightBarButton() {
        // 마이페이지 뷰로 이동
        print("didTappedRightBarButton")
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

//extension UITextField {
//    func setDatePicker(target: Any, selector: Selector) {
//            let SCwidth = self.bounds.width
//            let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: SCwidth, height: 400))
//            datePicker.datePickerMode = .date
//        datePicker.preferredDatePickerStyle = .inline
//            self.inputView = datePicker
//
//            let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: SCwidth, height: 44.0))
//            let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//            let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
//            let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
//            toolBar.setItems([cancel, flexible, barButton], animated: false)
//            self.inputAccessoryView = toolBar
//
//        }
//        @objc func tapCancel() {
//            self.resignFirstResponder()
//        }
//}
