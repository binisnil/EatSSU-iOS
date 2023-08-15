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
    let reviewProvider = MoyaProvider<ReviewRouter>(plugins: [MoyaLoggingPlugin()])
    var menuID: Int = Int()
    var type = "CHANGE"
    private var menuNameList = ["김치찌개", "단무지", "깍두기", "요구르트", "칼국수"]
    private var menuIDList: [Int] = [Int]()
    private var reviewList = [MenuDataList]()
    
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
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getReviewRate()
        getReviewList(type: type, menuId: menuID)
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
    
    func bindMenuID(id: Int) {
        menuID = id
    }
    
    private func showFixOrDeleteAlert() {
        let alert = UIAlertController(title: "리뷰 수정 혹은 삭제",
                                      message: "작성하신 리뷰를 수정 또는 삭제하시겠습니까?",
                                      preferredStyle: UIAlertController.Style.actionSheet
        )
        
        let fixAction = UIAlertAction(title: "수정하기",
                                      style: .default,
                                      handler: { okAction in })
        
        let deleteAction = UIAlertAction(title: "삭제하기",
                                      style: .default,
                                      handler: { okAction in })
        
        let cancelAction = UIAlertAction(title: "취소하기",
                                         style: .cancel,
                                         handler: nil)
        
        alert.addAction(fixAction)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showDeleteAlert() {
        let alert = UIAlertController(title: "리뷰 신고하기",
                                      message: "해당 리뷰를 신고하시겠습니까?",
                                      preferredStyle: UIAlertController.Style.alert
        )

        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel,
                                         handler: nil)
        
        let deleteAction = UIAlertAction(title: "신고",
                                         style: .default,
                                         handler: { okAction in
        })
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Action Method
    
    @objc
    func userTapReviewButton() {
        
        /// 메뉴가 여러개면 리뷰할 메뉴를 선택할 VC로 넘어가고, 그렇지 않다면 별점 설정 VC로 넘어갑니다.
        if menuNameList.count == 1 {
            let setRateViewController = SetRateViewController()
            menuIDList = [menuID]
            setRateViewController.dataBind(list: menuNameList, idList: menuIDList)
            self.navigationController?.pushViewController(setRateViewController, animated: true)
        } else {
            let choiceMenuViewController = ChoiceMenuViewController()
            choiceMenuViewController.menuDataBind(menuList: menuNameList, idList: menuIDList)
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

        cell.dataBind(response: reviewList[indexPath.row])
        cell.handler = { [weak self] in
            guard let self else { return }
            reviewList[indexPath.row].isWriter ? showFixOrDeleteAlert() : showDeleteAlert()
        }
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Server Setting

extension ReviewViewController {
    func getReviewRate() {
        self.reviewProvider.request(.reviewRate(type, menuID)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    let responseData = try moyaResponse.map(ReviewRateResponse.self)
                    self.topReviewView.dataBind(menuName: responseData.menuName,
                                                reviewCount: responseData.totalReviewCount,
                                                totalGrade: responseData.mainGrade,
                                                tasteGrade: responseData.tasteGrade,
                                                amountGrade: responseData.amountGrade,
                                                fiveCnt: responseData.reviewGradeCnt.fiveCnt,
                                                fourCnt: responseData.reviewGradeCnt.fourCnt,
                                                threeCnt: responseData.reviewGradeCnt.threeCnt,
                                                twoCnt: responseData.reviewGradeCnt.twoCnt,
                                                oneCnt: responseData.reviewGradeCnt.oneCnt)
                    self.menuNameList = responseData.menuName
                    print(responseData)
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getReviewList(type: String, menuId: Int) {
        self.reviewProvider.request(.reviewList(type, menuID)) { response in
            switch response {
            case .success(let moyaResponse):
                do {
                    let responseData = try moyaResponse.map(ReviewListResponse.self)
                    self.reviewList = responseData.dataList
                    self.reviewTableView.reloadData()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

extension ReviewViewController: ReviewMenuTypeInfoDelegate {
    func didDelegateReviewMenuTypeInfo(for menuTypeData: ReviewMenuTypeInfo) {
        var reviewMenuTypeInfo = ReviewMenuTypeInfo(menuType: menuTypeData.menuType, menuID: menuTypeData.menuID, changeMenuIDList: menuTypeData.changeMenuIDList)
        print("👍reviewMenuTypeInfo: \(reviewMenuTypeInfo)")
    }
}
