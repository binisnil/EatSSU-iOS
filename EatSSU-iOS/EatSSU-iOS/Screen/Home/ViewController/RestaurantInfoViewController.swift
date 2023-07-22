//
//  RestaurantInfoViewController.swift.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/10.
//

import UIKit

import MapKit
import SnapKit
import Then

class RestaurantInfoViewController: BaseViewController {
    
    // MARK: - Properties

//    var restaurantInfoData: RestaurantInfoData? {
//        didSet {
//            configureRestaurantInfo()
//        }
//    }

    // MARK: - UI Components
    
    private let restaurantInfoView = RestaurantInfoView()

    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(restaurantInfoView
                         )
    }
    
    override func setLayout() {
        restaurantInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
//    func setMapView() {
//        // Set the region on the map view
//        mapView.setRegion(region, animated: true)
//
//        // Create a point annotation for the dormitory (Assuming the dormitory is located at these coordinates)
//        let annotation = MKPointAnnotation()
//
//        // Set the coordinate of the annotation to be the location of the dormitory
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.495941, longitude: 126.957899)
//
//        // Optionally, add a title to the annotation
//        annotation.title = "기숙사 식당"
//
//        // Add the annotation to the map view
//        mapView.addAnnotation(annotation)
//    }
//
//    func loadRestaurantInfo() {
//        restaurantInfoData = RestaurantInfoData.dummy()
//    }
//
//    func configureRestaurantInfo() {
//        guard let data = restaurantInfoData else {return}
//        self.locationLabel.text = "\(data.location)"
//        self.dayTypeLabel.text = "\(data.openHours[0].dayType)"
//        self.timepartLabel.text = "\(data.openHours[0].timePart)"
//        self.timeLabel.text = "\(data.openHours[0].time)"
//    }
}
