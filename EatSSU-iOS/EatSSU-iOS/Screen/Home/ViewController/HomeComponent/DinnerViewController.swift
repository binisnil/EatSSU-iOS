//
//  DinnerViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import SnapKit
import Moya

class DinnerViewController: BaseViewController {
    
    //MARK: - Properties
    
    let morningTableProvider = MoyaProvider<HomeRouter>()
    let tabBarHeight: CGFloat = 50
    
    //MARK: - UI Components
    
    private let contentView = UIView()
    let dinnerView = HomeRestaurantView()
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
    }
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonEvent()
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(dinnerView)
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

        dinnerView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        dinnerView.dormitoryCoordinateButton.addTarget(self, action: #selector(didTappedMapViewButton), for: .touchUpInside)
    }
    
    func dinnerMenuAPI(date: String) {
        dinnerView.getChangeMenuTableResponse(date: date, restaurant: "DOMITORY", time: "DINNER")
        dinnerView.getChangeMenuTableResponse(date: date, restaurant: "DODAM", time: "DINNER")
        dinnerView.getChangeMenuTableResponse(date: date, restaurant: "HAKSIK", time: "DINNER")
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
