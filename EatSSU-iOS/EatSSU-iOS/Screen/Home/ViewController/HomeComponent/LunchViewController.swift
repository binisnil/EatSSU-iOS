//
//  LunchViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import SnapKit

class LunchViewController: BaseViewController {
    
    //MARK: - UI Components
    
    private let contentView = UIView()
    private let morningView = MorningView()

    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(morningView)
    }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(190)
            $0.horizontalEdges.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }

        morningView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        morningView.allRestaurantStackView.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    override func setButtonEvent() {
        morningView.dormitoryCoordinateButton.addTarget(self, action: #selector(didTappedMapViewButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedMapViewButton() {
        let mapVC = RestaurantMapViewController()
        present(mapVC, animated: true, completion: nil)

    }
}
