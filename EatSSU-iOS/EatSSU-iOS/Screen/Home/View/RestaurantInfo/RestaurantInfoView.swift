//
//  RestaurantInfoView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/23.
//

import UIKit

import MapKit
import SnapKit
import Then

class RestaurantInfoView: BaseUIView {
    
    // MARK: - Properties
    static let tableViewCellHeight = 10.0
    var restaurantInfoInputData: RestaurantInfoResponse? {
        didSet {
            configureRestaurantInfo()
        }
    }
    
    var times: [TimeData] = [
        TimeData(timepart: "조식", time: "11:30-13:30(식사제공), 14:00-17:00(공간 개방)"),
        TimeData(timepart: "중식", time: "12:00-13:00"),
        TimeData(timepart: "석식", time: "11:30-13:30")
    ]
    
    // MARK: - UI Components
    
    let mapView = MKMapView()
    let weekdayTimeTableView = RestaurantInfoTimeTableView()
    let weekendTimeTableView = RestaurantInfoTimeTableView()

    var restaurantNameLabel = UILabel().then {
        $0.font = .bold(size: 22)
    }
    private let lineView = UIView().then {
        $0.backgroundColor = .primary
    }
    private let restaurantLocationTitleLabel = UILabel().then {
        $0.text = "식당 위치"
        $0.font = .semiBold(size: 18)
    }
    private var locationLabel = UILabel().then {
        $0.font = .medium(size: 16)
    }
    private let lineView1 = UIView().then {
        $0.backgroundColor = .primary
    }
    private let openingTimeTitleLabel = UILabel().then {
        $0.text = "영업 시간"
        $0.font = .semiBold(size: 18)
    }
    private let lineView2 = UIView().then {
        $0.backgroundColor = .gray500
    }
    private let weekdayTitleLabel = UILabel().then {
        $0.text = "주중"
        $0.font = .medium(size: 16)
    }
    private let weekendTitleLabel = UILabel().then {
        $0.text = "주말, 공휴일"
        $0.font = .medium(size: 16)
    }
    
    // Define a region for Soongsil University (Latitude and longitude for Soongsil University)
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.496311, longitude: 126.957676), span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setMapView()
        setDelegate()
        registerCell()        
    }
    
    //MARK: - Functions
    
    override func configureUI() {
        self.addSubviews(restaurantNameLabel,
                         lineView,
                         restaurantLocationTitleLabel,
                         locationLabel,
                        mapView,
                         openingTimeTitleLabel,
                         lineView1,
                         weekdayTitleLabel,
                         weekdayTimeTableView,
                         lineView2,
                         weekendTitleLabel,
                         weekendTimeTableView
                         )
    }
    
    override func setLayout() {
        restaurantNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalToSuperview()
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(restaurantNameLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(28)
            $0.height.equalTo(2)
        }
        restaurantLocationTitleLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(26)
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(restaurantLocationTitleLabel)
            $0.trailing.equalToSuperview().offset(-26)
        }
        mapView.snp.makeConstraints {
            $0.top.equalTo(restaurantLocationTitleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(256)
        }
        openingTimeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(26)
        }
        lineView1.snp.makeConstraints {
            $0.top.equalTo(openingTimeTitleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(28)
            $0.height.equalTo(2)
        }
        weekdayTitleLabel.snp.makeConstraints {
            $0.top.equalTo(lineView1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        weekdayTimeTableView.snp.makeConstraints {
            $0.top.equalTo(weekdayTitleLabel)
            $0.trailing.equalToSuperview().inset(26)
            $0.width.equalTo(200)
        }
        lineView2.snp.makeConstraints {
            $0.top.equalTo(weekdayTimeTableView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(28)
            $0.height.equalTo(2)
        }
        weekendTitleLabel.snp.makeConstraints {
            $0.top.equalTo(lineView2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        weekendTimeTableView.snp.makeConstraints {
            $0.top.equalTo(weekendTitleLabel)
            $0.trailing.equalToSuperview().inset(26)
            $0.width.equalTo(200)
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
    
    func setDelegate() {
        weekdayTimeTableView.dataSource = self
        weekendTimeTableView.dataSource = self
    }
    
    func registerCell() {
        weekdayTimeTableView.register(TimeDataTableViewCell.self, forCellReuseIdentifier: TimeDataTableViewCell.identifier)
        weekendTimeTableView.register(TimeDataTableViewCell.self, forCellReuseIdentifier: TimeDataTableViewCell.identifier)
    }
    
    func configureRestaurantInfo() {
        self.locationLabel.text = restaurantInfoInputData?.location
        
    }
}

extension RestaurantInfoView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TimeDataTableViewCell.identifier, for: indexPath) as? TimeDataTableViewCell else { return TimeDataTableViewCell() }
        cell.selectionStyle = .none
        cell.bind(timeData: times[indexPath.row])
        return cell
    }
}

