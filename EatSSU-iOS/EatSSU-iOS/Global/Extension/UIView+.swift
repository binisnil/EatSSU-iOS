//
//  UIView+.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/15.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

