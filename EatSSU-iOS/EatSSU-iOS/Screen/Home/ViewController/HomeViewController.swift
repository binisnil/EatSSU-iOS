////
////  ViewController.swift
////  EatSSU-iOS
////
////  Created by 최지우 on 2023/02/13.
////
//
//import UIKit
//
//import Pageboy
//import SnapKit
//import Tabman
//
//class HomeViewController: TabmanViewController {
//
//    // MARK: - Properties
//
//    let realm = RealmService()
//    // FIXME: true로 바꿨는데 로직 상 수정 필요하면 말씀해주세요
//    var isPreview = true
//
//    // MARK: - UI Components
//
//    let morningView = MorningView()
//    let lunchView = LunchView()
//
////    private let contentView = UIView()
//    public let bar = TMBar.ButtonBar().then {
//        $0.backgroundColor = .gray300
//    }
//
//    var dateSelectedField = UITextField().then {
//        $0.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
//        $0.tintColor = .clear
//        $0.textColor = .darkGray
//        $0.font = .boldSystemFont(ofSize: 18)
////        $0.backgroundColor = .blue
//    }
//
//    let datePicker = UIDatePicker().then {
//        $0.addTarget(self, action: #selector(didSelectedDate(_:)), for: .valueChanged)
//    }
//
//    var viewControllers: Array<UIViewController> = [MorningViewController(), LunchViewController(), DinnerViewController()]
//
//    let scrollView = UIScrollView().then {
//        $0.backgroundColor = .systemBackground
//        $0.showsVerticalScrollIndicator = false
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.dataSource = self
//        settingTabBar(ctBar: bar)
//        addBar(bar, dataSource: self, at: .top)
//
//        self.view.backgroundColor = .systemBackground
//        setnavigation()
//        self.configureUI()
//        self.setLayout()
//
//        self.createDatePicker()
//
//        // 초기 날짜 표시
//        self.setTodayDateLabel(with: Date())
//    }
//
//    func configureUI() {
//        view.addSubviews(dateSelectedField)
//    }
//
//    func setLayout() {
//        dateSelectedField.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            $0.leading.trailing.equalToSuperview().inset(140)
////            $0.bottom.equalTo(bar.snp.top)
//            $0.height.equalTo(25)
//        }
//
//        bar.snp.makeConstraints {
//            $0.top.equalTo(dateSelectedField.snp.bottom)
//            $0.width.equalToSuperview()
//            $0.height.equalTo(50)
//       }
//
//    }
//
//    func setnavigation() {
////        navigationController?.navigationBar.backgroundColor = .green
//        navigationItem.titleView = UIImageView(image: ImageLiteral.EatSSULogo)
//        navigationController?.isNavigationBarHidden = false
//        if isPreview {
//            let rightButton = UIBarButtonItem(image: ImageLiteral.myPageIcon, style: .plain, target: self, action: #selector(didTappedRightBarButton))
//            rightButton.tintColor = .primary
//            navigationItem.rightBarButtonItem = rightButton
//        } else {
//            navigationItem.hidesBackButton = true
//        }
//    }
//
//    func createDatePicker() {
//        datePicker.preferredDatePickerStyle = .inline
//        datePicker.datePickerMode = .date
//        datePicker.backgroundColor = .white
//        datePicker.tintColor = .primary
//
//        dateSelectedField.inputView = datePicker
//    }
//
//    func setTodayDateLabel(with date: Date) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy.MM.dd"
//        dateSelectedField.text = formatter.string(from: date)
//    }
//
//    @objc
//    func didTappedRightBarButton() {
//        // 마이페이지 뷰로 이동
//        let nextVC = MyPageViewController()
//        self.navigationController?.pushViewController(nextVC, animated: true)
//    }
//
//    // FIXME: date 전달
//    @objc func didSelectedDate(_ sender: UIDatePicker) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
//        dateFormatter.dateFormat = "yyyy.MM.dd"
//        dateSelectedField.text = dateFormatter.string(from: sender.date)
//        view.endEditing(true)
//    }
//}
//
//
//// MARK: - PageBoy Extension
//
//extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
//
//    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
//        return viewControllers.count
//    }
//
//    func viewController(for pageboyViewController: Pageboy.PageboyViewController,
//                        at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
//        return viewControllers[index]
//    }
//
//    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
//        nil
//    }
//
//    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
//        switch index {
//        case 0:
//            return TMBarItem(title: "아침")
//        case 1:
//            return TMBarItem(title: "점심")
//        case 2:
//            return TMBarItem(title: "저녁")
//        default:
//            let title = "Page \(index)"
//            return TMBarItem(title: title)
//        }
//    }
//
//    func settingTabBar (ctBar: TMBar.ButtonBar) {
//        ctBar.layout.transitionStyle = .snap
//        ctBar.backgroundView.style = .blur(style: .light)
//        ctBar.buttons.customize { (button) in
//            button.tintColor = .gray700
//            button.selectedTintColor = .black
//            button.font = UIFont.systemFont(ofSize: 16)
//            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
//        }
//        ctBar.indicator.weight = .custom(value: 2)
//        ctBar.indicator.tintColor = .primary
//        ctBar.indicator.overscrollBehavior = .compress
//        ctBar.layout.contentMode = .fit

//bar.backgroundView.style = .blur(style: .regular)
//        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
//        bar.buttons.customize { (button) in
//            button.tintColor = .mainGray // 선택 안되어 있을 때
//            button.selectedTintColor = .black // 선택 되어 있을 때
//        }
//        // 인디케이터 조정
//        bar.indicator.weight = .light
//        bar.indicator.tintColor = .black
//        bar.indicator.overscrollBehavior = .compress
//        bar.layout.alignment = .centerDistributed
//        bar.layout.contentMode = .fit
//        bar.layout.interButtonSpacing = 35 // 버튼 사이 간격
//
//        bar.layout.transitionStyle = .snap // Customize
//        }
//
//    func isPreviewButtonTapped(preview: Bool) {
//        isPreview = preview
//    }
//}

