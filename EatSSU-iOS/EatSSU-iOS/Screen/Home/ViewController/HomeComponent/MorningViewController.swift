//
//  MorningViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import SnapKit
import Then

class MorningViewController: BaseViewController {
    
    //MARK: - UI Components
    
    private let contentView = UIView()
    private let morningView = MorningView()
    
    
    private let scrollView = UIScrollView().then {
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
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.height.equalToSuperview()
        }
        
        morningView.snp.makeConstraints {
            $0.width.height.equalTo(contentView)
        }
    }
    
    override func setButtonEvent() {
        morningView.coordinateButton.addTarget(self, action: #selector(didTappedMapViewButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedMapViewButton() {
        let mapVC = RestaurantMapViewController()
        present(mapVC, animated: true, completion: nil)

    }
}

