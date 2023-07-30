//
//  ReviewViewController.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/04/07.
//

import UIKit

import Moya

class ReviewViewController: BaseViewController {
    
    // MARK: - Properties
    let reviewProvider = MoyaProvider<ReviewRouter>()
    private let menuDummy = ["김치찌개", "단무지", "깍두기", "요구르트", "칼국수"]
    private var reviewList = [DataList]()
    
    // MARK: - UI Component
    
    let topReviewView = ReviewRateView()
    
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .background
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
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTableView.register(ReviewTableCell.self, forCellReuseIdentifier: ReviewTableCell.identifier)
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        getMenuReview(menuId: 35)
        getTotalReview(menuId: 35)
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Functions
    override func configureUI() {
        topReviewView.backgroundColor = .white
        reviewTableView.backgroundColor = .white
        view.addSubviews(topReviewView, progressView, reviewLabel, reviewTableView)
    }
    
    override func setLayout() {
        topReviewView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(topReviewView.addReviewButton.snp.bottom).offset(23)
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
            make.top.equalTo(reviewLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func setButtonEvent() {
        topReviewView.addReviewButton.addTarget(self, action: #selector(userTapReviewButton), for: .touchUpInside)
    }
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = "리뷰"
    }
    
    @objc
    func userTapReviewButton() {
        
        /// 메뉴가 여러개면 리뷰할 메뉴를 선택할 VC로 넘어가고, 그렇지 않다면 별점 설정 VC로 넘어갑니다.
        if menuDummy.count == 0 {
            let setRateViewController = SetRateViewController()
            self.navigationController?.pushViewController(setRateViewController, animated: true)
        } else {
            let choiceMenuViewController = ChoiceMenuViewController()
            choiceMenuViewController.menuDataBind(menuList: menuDummy)
            self.navigationController?.pushViewController(choiceMenuViewController, animated: true)
        }
    }
}

extension ReviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell did touched")
    }
}

extension ReviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableCell.identifier, for: indexPath) as? ReviewTableCell ?? ReviewTableCell()

        let cellReview: DataList = reviewList[indexPath.row]
        cell.dataBind(nickname: cellReview.writerNickname,
                      grade: cellReview.grade,
                      content: cellReview.content,
                      date: cellReview.writeDate,
                      tagList: cellReview.tagList)
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Server Setting

extension ReviewViewController {
    
    func getTotalReview(menuId: Int) {
        self.reviewProvider.request(.totalReview(menuId)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseData = try moyaResponse.map(TotalReviewResponse.self)
                    self.topReviewView.dataBind(menuName: responseData.menuName,
                                                reviewCount: responseData.totalReviewCount,
                                                totalGrade: responseData.grade,
                                                fiveCnt: responseData.reviewGradeCnt.fiveCnt,
                                                fourCnt: responseData.reviewGradeCnt.fourCnt,
                                                threeCnt: responseData.reviewGradeCnt.threeCnt,
                                                twoCnt: responseData.reviewGradeCnt.twoCnt,
                                                oneCnt: responseData.reviewGradeCnt.oneCnt)
                    
                    print(responseData)
                    
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getMenuReview(menuId: Int) {
        self.reviewProvider.request(.menuReview(menuId)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseData = try moyaResponse.map(MenuReviewResponse.self)
                    self.reviewList = responseData.dataList ?? []
                    self.reviewTableView.reloadData()
//                    print(responseData)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

extension ReviewViewController: BindCellMenuTypeInfoDelegate {
    func didBindMenuTypeInfo(menuTypeInfo: MenuTypeInfo) {
        print(menuTypeInfo)
    }
    
}
