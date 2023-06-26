//
//  UIButton+.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/06/27.
//

import UIKit

extension UIButton {
    
    func setRoundBorder(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        layer.masksToBounds = true
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
    
}
