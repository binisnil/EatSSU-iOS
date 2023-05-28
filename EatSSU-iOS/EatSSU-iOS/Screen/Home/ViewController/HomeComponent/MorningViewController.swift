//
//  MorningViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/03/15.
//

import UIKit

import Moya
import SnapKit
import Then

class MorningViewController: BaseViewController {
    
    //MARK: - Properties
    
    let morningTableProvider = MoyaProvider<HomeRouter>()
    
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
        preferredContentSize = CGSize(width: 300, height: 400)
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
        mapVC.preferredContentSize = CGSize(width: 200, height: 300)
        mapVC.modalPresentationStyle = .popover
        
        let ppc = mapVC.popoverPresentationController
        ppc?.permittedArrowDirections = .any
        ppc?.sourceView = self.view
        ppc?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        present(mapVC, animated: true, completion: nil)

    }
}

// MARK: - Network

extension MorningViewController {
    
    func getMorningMenuTable(menuId: Int) {
        self.morningTableProvider.request(.morningMenuTable(menuId: menuId)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseDetailDto = try moyaResponse.map(MenuTableResponse.self)
                    self.bindMenuTable(responseDetailDto)
                }
            }
        }
    }
    
    func bindMenuTable(_ data: MenuTableResponse) {
        self.morningView.dataBind(     : data.
    }
}
//
//switch response {
//            case .success(let result):
//                let status = result.statusCode
//                if status >= 200 && status < 300 {
//                    do {
//                        let responseDetailDto = try result.map(BookDetailResponseDTO.self)
//                        self.fetchDetail(data: responseDetailDto)
//                    }
//                    catch(let error) {
//                        print(error.localizedDescription)
//                    }
//                } else if status >= 400 {
//                    print("400 error")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
