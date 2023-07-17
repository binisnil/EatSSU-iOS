//
//  HomeCalendarView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/15.
//

import UIKit

import FSCalendar
import SnapKit
import Then

class HomeCalendarView: BaseUIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    fileprivate var calendar = FSCalendar()
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setUpCalendar()
//        self.backgroundColor = .green
    }
    
    // MARK: - Functions

    
    override func configureUI() {
        
    }
    
    override func setLayout() {
        
    }
    
    // MARK: setupView
    private func setupView() {
 
        calendar.dataSource = self
        calendar.delegate = self
       
        self.addSubview(calendar)
        calendar.snp.makeConstraints {
            $0.height.equalTo(300)
            $0.left.right.equalToSuperview()
        }
//       self.changeTitle(date: Date())
   }
    
}

extension HomeCalendarView: FSCalendarDataSource, FSCalendarDelegate {
    
    private func setUpCalendar() {
        
        // Base
        calendar.scope = .week
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.scrollEnabled = true
        calendar.scrollDirection = .horizontal
        
        // Header Title
        calendar.headerHeight = 30
        calendar.weekdayHeight = 10
        
        // 달력의 맨 위의 년도, 월의 색깔
        calendar.appearance.headerTitleColor = .gray500
        calendar.appearance.headerTitleFont = .bold(size: 18)
        // 달력의 년월 글자 바꾸기
        calendar.appearance.headerDateFormat = "YYYY. MM"
        // 년월에 흐릿하게 보이는 애들 없애기
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        
        // Day
        calendar.appearance.weekdayFont = .medium(size: 10)
        calendar.appearance.weekdayTextColor = .gray500
        
        // Date
        calendar.appearance.titleFont = .bold(size: 16)
        calendar.appearance.todayColor = .white
        calendar.appearance.titleTodayColor = .primary
        
        // Selection
        calendar.allowsSelection = true
        calendar.allowsMultipleSelection = false
        calendar.appearance.borderRadius = 20
        calendar.appearance.selectionColor = .primary
        
        // 오늘 날짜 Select
        calendar.select(Date())
        
        // 캘린더 숫자와 subtitle간의 간격 조정
//        calendar.appearance.subtitleOffset = CGPoint(x: 0, y: 10)

    }
    
//    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
//        calendar.snp.updateConstraints { (make) in
//            make.height.equalTo(bounds.height)
//            // Do other updates
//        }
////        self.view.layoutIfNeeded()
//        self.layoutSubviews()
//    }
}
