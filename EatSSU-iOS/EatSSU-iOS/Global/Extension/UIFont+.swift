//
//  UIFont+.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/15.
//

import UIKit

enum AppFontName: String {
    case regularFont = "AppleSDGothicNeo-Regular"
    case mediumFont = "AppleSDGothicNeo-Medium"
    case semiBoldFont = "AppleSDGothicNeo-SemiBold"
    case boldFont = "AppleSDGothicNeo-Bold"
    case extraBoldFont = "AppleSDGothicNeo-ExtraBold"
}

extension UIFont {
    
    class func regular(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regularFont.rawValue, size: size)!
    }
    
    class func medium(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.mediumFont.rawValue, size: size)!
    }
    
    class func semiBold(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.semiBoldFont.rawValue, size: size)!
    }
    
    class func bold(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.boldFont.rawValue, size: size)!
    }
}
