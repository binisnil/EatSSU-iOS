//
//  RestaurantMapViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/10.
//

import UIKit

import MapKit
import SnapKit
import Then

class RestaurantMapViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let restaurantNameLabel = UILabel().then {
        $0.text = "숭실 도담 식당"
        $0.font = .bold(size: 22)
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .primary
    }
    
    private let restaurantLocationLabel = UILabel().then {
        $0.text = "식당 위치"
        $0.font = .semiBold(size: 18)
    }
    
    private let openingTimeLabel = UILabel().then {
        $0.text = "영업 시간"
        $0.font = .semiBold(size: 18)
    }
    
    private let weekdayLabel = UILabel().then {
        $0.text = "주중"
        $0.font = .medium(size: 16)
    }
    
    // Create a map view
//    let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: 317, height: 256))
    let mapView = MKMapView()

    // Define a region for Soongsil University (Latitude and longitude for Soongsil University)
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.496311, longitude: 126.957676), span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))

   
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        
        setMapView()
        configureUI()
        setLayout()
    
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        view.addSubviews(restaurantNameLabel,
                         lineView,
                         restaurantLocationLabel,
                        mapView,
                         openingTimeLabel
                         )
    }
    
    override func setLayout() {
        restaurantNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalToSuperview()
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(restaurantNameLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().offset(-28)
            $0.height.equalTo(2)
        }
        restaurantLocationLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(39)
        }
        mapView.snp.makeConstraints {
            $0.top.equalTo(restaurantLocationLabel.snp.bottom).offset(12)
            $0.width.equalTo(335)
            $0.height.equalTo(256)
            $0.centerX.equalToSuperview()
        }
        openingTimeLabel.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(39)
        }
    }
    
    func setMapView() {
        // Set the region on the map view
        mapView.setRegion(region, animated: true)

        // Create a point annotation for the dormitory (Assuming the dormitory is located at these coordinates)
        let annotation = MKPointAnnotation()

        // Set the coordinate of the annotation to be the location of the dormitory
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.495941, longitude: 126.957899)

        // Optionally, add a title to the annotation
        annotation.title = "기숙사 식당"

        // Add the annotation to the map view
        mapView.addAnnotation(annotation)
    }
    
}
