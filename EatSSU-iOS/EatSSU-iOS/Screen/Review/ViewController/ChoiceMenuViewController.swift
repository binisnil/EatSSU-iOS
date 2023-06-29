//
//  ChoiceMenuViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/06/29.
//

import UIKit

import SnapKit
import Then

class ChoiceMenuViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Component
    
    private let enjoyLabel = UILabel()
    private let whichFoodLabel = UILabel()
    private lazy var choiceMenuTabelView = UITableView(frame: .zero, style: .plain)
    private lazy var nextButton = UIButton()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewConfig()
    }
    
    // MARK: - Functions
    override func configureUI() {
        
        enjoyLabel.do {
            $0.text = "식사는 맛있게 하셨나요?"
            $0.font = .medium(size: 18)
            $0.textColor = .gray700
        }
        
        whichFoodLabel.do {
            $0.text = "어떤 음식에 대한 리뷰인가요?"
            $0.font = .bold(size: 20)
            $0.textColor = .black
        }
        
        choiceMenuTabelView.do {
            $0.separatorStyle = .none
        }
        
        nextButton.do {
            $0.setTitle("다음 단계로", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .semiBold(size: 18)
            $0.backgroundColor = .primary
            $0.layer.cornerRadius = 10
        }
        
        self.view.addSubviews(enjoyLabel,
                              whichFoodLabel,
                              choiceMenuTabelView,
                              nextButton)
    }
    
    override func setLayout() {
        
        enjoyLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(25)
            $0.centerX.equalToSuperview()
        }
        
        whichFoodLabel.snp.makeConstraints {
            $0.top.equalTo(enjoyLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        choiceMenuTabelView.snp.makeConstraints {
            $0.top.equalTo(whichFoodLabel.snp.bottom).offset(40)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).inset(27)
            $0.height.equalTo(40)
        }
    }
    
    override func setButtonEvent() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = "리뷰 남기기"
    }
    
    private func setTableViewConfig() {
        self.choiceMenuTabelView.delegate = self
        self.choiceMenuTabelView.dataSource = self
        self.choiceMenuTabelView.register(ChoiceMenuTableViewCell.self,
                                          forCellReuseIdentifier: ChoiceMenuTableViewCell.identifier)
    }
    
    @objc
    func nextButtonTapped() {
        let setRateVC = SetRateViewController()
        self.navigationController?.pushViewController(setRateVC, animated: true)
    }
    
    @objc
    func checkButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
}

extension ChoiceMenuViewController: UITableViewDelegate {}
extension ChoiceMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChoiceMenuTableViewCell.identifier) as? ChoiceMenuTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let touchedCell = tableView.cellForRow(at: indexPath) as! ChoiceMenuTableViewCell
        touchedCell.checkButton.isSelected.toggle()
    }
}
