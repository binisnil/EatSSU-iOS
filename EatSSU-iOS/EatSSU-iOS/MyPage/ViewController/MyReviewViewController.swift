//
//  MyReviewViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/07/27.
//

import UIKit

import SnapKit
import Then
import Moya

class MyReviewViewController: BaseViewController {
    
    // MARK: - Properties
    private let myProvider = MoyaProvider<MyRouter>(plugins: [MoyaLoggingPlugin()])
    private var reviewList = [MyDataList]()
    
    // MARK: - UI Components
    
    let myReviewView = MyReviewView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        postMyReview()
    }
    
    // MARK: - Functions
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = TextLiteral.myReview
    }
    
    override func configureUI() {
        view.addSubview(myReviewView)
    }
    
    override func setLayout() {
        myReviewView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        myReviewView.myReviewTableView.register(ReviewTableCell.self, forCellReuseIdentifier: ReviewTableCell.identifier)
        myReviewView.myReviewTableView.delegate = self
        myReviewView.myReviewTableView.dataSource = self
    }
}

extension MyReviewViewController: UITableViewDelegate {}

extension MyReviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableCell.identifier, for: indexPath) as? ReviewTableCell ?? ReviewTableCell()
        cell.myPageDataBind(response: reviewList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Server

extension MyReviewViewController {
    private func postMyReview() {
        self.myProvider.request(.myReview) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    let responseData = try moyaResponse.map(MyReviewResponse.self)
                    self.reviewList = responseData.dataList
                    self.myReviewView.myReviewTableView.reloadData()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
