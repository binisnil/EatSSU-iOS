//
//  MenuTableView.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/05/10.
//

import UIKit

final class MenuTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTableView()
    }
    
    override var intrinsicContentSize: CGSize {
        let height = self.contentSize.height + self.contentInset.top + self.contentInset.bottom
        return CGSize(width: self.contentSize.width, height: height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.invalidateIntrinsicContentSize()
    }

    private func setupTableView() {
        self.showsVerticalScrollIndicator = false
        self.layer.cornerRadius = 15.0
        self.isScrollEnabled = false
    }
}

