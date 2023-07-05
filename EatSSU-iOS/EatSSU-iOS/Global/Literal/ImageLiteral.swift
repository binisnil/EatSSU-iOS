//
//  ImageLiteral.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/04/07.
//

import UIKit

enum ImageLiteral {
    
    // MARK: - logo
    
    static var splashLogo: UIImage { .load(name: "splashLogo")}
    static var EatSSULogo: UIImage { .load(name: "EatSSULogo")}
    
    // MARK: - sign in
    
    static var signInImage: UIImage { .load(name: "signInImage")}
    static var appleIcon: UIImage { .load(name: "appleIcon")}
    
    // MARK: - icon
    
    static var menuIcon: UIImage { .load(name: "menuIcon")}
    static var checkedIcon: UIImage {.load(name: "checkedIcon")}
    static var uncheckedIcon: UIImage {.load(name: "uncheckedIcon")}
    static var coordinate: UIImage {.load(name: "coordinate")}
    
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}
