//
//  ReviewViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/04.
//

import UIKit

class ReviewViewController: BaseViewController {
    
    //MARK: - UI Component
    
    let topReviewView = ReviewRateView()
    
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray
        return view
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "리뷰"
        label.font = .bold(size: 18)
        label.textColor = .black
        return label
    }()
    
    let reviewTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTableView.register(ReviewTableCell.self, forCellReuseIdentifier: ReviewTableCell.identifier)
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
    }
    
    //MARK: - Function

    override func configureUI() {
        topReviewView.backgroundColor = .white
        reviewTableView.backgroundColor = .white
        view.addSubviews(topReviewView, progressView, reviewLabel, reviewTableView)
    }
    
    override func setLayout() {
        topReviewView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(350)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(topReviewView.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(8)
        }
        reviewLabel.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        reviewTableView.snp.makeConstraints { make in
            make.top.equalTo(reviewLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        topReviewView.addReviewButton.addTarget(self, action: #selector(userTapReviewButton), for: .touchUpInside)
    }
    
    @objc func userTapReviewButton() {
        let nextVC = SetRateViewController()
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ReviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell did touched")
    }
}

extension ReviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableCell.identifier, for: indexPath) as? ReviewTableCell ?? ReviewTableCell()
        return cell
    }
}
