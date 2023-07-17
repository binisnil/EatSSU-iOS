//
//  LunchViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import SnapKit
import Moya

class LunchViewController: BaseViewController {
    
    //MARK: - Properties
    
    let morningTableProvider = MoyaProvider<HomeRouter>()
    
    //MARK: - UI Components
    
    private let contentView = UIView()
    private let morningView = MorningView()
    let tabBarHeight: CGFloat = 50


    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonEvent()
//        preferredContentSize = CGSize(width: 300, height: 400)
        morningView.backgroundColor = .yellow
        
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(morningView)
    }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(tabBarHeight)
            
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }

        morningView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        morningView.dormitoryCoordinateButton.addTarget(self, action: #selector(didTappedMapViewButton), for: .touchUpInside)
    }
    
    @objc
    func didTappedMapViewButton() {
        let mapVC = RestaurantMapViewController()
        mapVC.preferredContentSize = CGSize(width: 200, height: 300)
        mapVC.modalPresentationStyle = .popover
        
        let ppc = mapVC.popoverPresentationController
        ppc?.permittedArrowDirections = .any
        ppc?.sourceView = self.view
        ppc?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        present(mapVC, animated: true, completion: nil)
    }
}
