//
//  RestaurantLocation.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/24.
//

import Foundation
import CoreLocation
import MapKit

enum RestaurantLocation {
    case dormitory
    case dodam
    case studentRestaurant
    case foodCourt
    case snackCorner
    case theKitchen
    case soongsil
    
    var coordinate: CLLocationCoordinate2D {
        switch self {
        case .dormitory:
            return CLLocationCoordinate2D(latitude: 37.495941, longitude: 126.957899)
        case .dodam:
            return CLLocationCoordinate2D(latitude: 37.496000, longitude: 126.958000)
        case .studentRestaurant:
            return CLLocationCoordinate2D(latitude: 37.496100, longitude: 126.958100)
        case .foodCourt:
            return CLLocationCoordinate2D(latitude: 37.496200, longitude: 126.958200)
        case .snackCorner:
            return CLLocationCoordinate2D(latitude: 37.496300, longitude: 126.958300)
        case .theKitchen:
            return CLLocationCoordinate2D(latitude: 37.496400, longitude: 126.958400)
        case .soongsil:
            return CLLocationCoordinate2D(latitude: 37.496311, longitude: 126.957676)
        }
    }
    
    var title: String {
        switch self {
        case .dormitory:
            return TextLiteral.dormitoryRestaurant
        case .dodam:
            return TextLiteral.dodamRestaurant
        case .studentRestaurant:
            return TextLiteral.studentRestaurant
        case .foodCourt:
            return TextLiteral.foodCourt
        case .snackCorner:
            return TextLiteral.snackCorner
        case .theKitchen:
            return TextLiteral.theKitchen
        case .soongsil:
            return "숭실대학교"
        }
    }
}

func setMapView(mapView: MKMapView, for location: RestaurantLocation) {
    let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    
    // Set the region on the map view
    mapView.setRegion(region, animated: true)
    
    // Create a point annotation
    let annotation = MKPointAnnotation()
    // Set the coordinate of the annotation to be the location
    annotation.coordinate = location.coordinate
    // Optionally, add a title to the annotation
    annotation.title = location.title
    // Add the annotation to the map view
    mapView.addAnnotation(annotation)
    
}
