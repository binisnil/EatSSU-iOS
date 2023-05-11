//
//  MenuTableView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/10.
//

import UIKit

final class MenuTableView: UITableView {
  override var intrinsicContentSize: CGSize {
    let height = self.contentSize.height + self.contentInset.top + self.contentInset.bottom
    return CGSize(width: self.contentSize.width, height: height)
  }
  override func layoutSubviews() {
    self.invalidateIntrinsicContentSize()
    super.layoutSubviews()
  }
}
