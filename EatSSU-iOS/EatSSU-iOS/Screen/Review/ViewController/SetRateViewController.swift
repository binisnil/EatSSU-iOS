//
//  setRateViewController.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/03/23.
//

import UIKit

import SnapKit
import Then
import Moya

class SetRateViewController: BaseViewController, UINavigationControllerDelegate {
    
    // MARK: - Properties

    private let writeReviewProvider = MoyaProvider<WriteReviewRouter>(plugins: [MoyaLoggingPlugin()])
    private var selectedList: [String] = [] {
        didSet {
            menuLabel.text = "\(selectedList[0]) 을 추천하시겠어요?"
            if selectedList.count == 1 {
                nextButton.setTitle("리뷰 남기기", for: .normal)
            }
        }
    }
    
    // MARK: - UI Components
    
    private var rateView = RateView()
    private var tasteRateView = RateView()
    private var quantityRateView = RateView()
    private let imagePickerController = UIImagePickerController()
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "리뷰"
        label.font = .bold(size: 22)
        label.textColor = .black
        return label
    }()
    
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .primary
        return view
    }()
    
    private var menuLabel: UILabel = {
        let label = UILabel()
        label.text = "김치볶음밥 & 계란국을 추천하시겠어요?"
        label.font = .bold(size: 20)
        label.textColor = .black
        return label
    }()
    
    private var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "해당 메뉴에 대한 상세한 평가를 남겨주세요."
        label.font = .medium(size: 16)
        label.textColor = .gray700
        return label
    }()
    
    private var tasteLabel: UILabel = {
        let label = UILabel()
        label.text = "맛"
        label.font = .bold(size: 20)
        label.textColor = .black
        return label
    }()
    
    private var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "양"
        label.font = .bold(size: 20)
        label.textColor = .black
        return label
    }()
    
    lazy var tasteStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 65
        $0.alignment = .center
    }
    
    lazy var quantityStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 65
        $0.alignment = .center
    }
    
    private let userReviewTextView: UITextView = {
        let textView = UITextView()
        textView.font = .medium(size: 16)
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .background
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        return textView
    }()
    
    private lazy var userReviewImageView = UIImageView().then {
        $0.layer.cornerRadius = 10 // 원하는 둥근 모서리의 크기
        $0.clipsToBounds = true // 이 속성을 true로 설정해야 둥근 모서리가 보입니다.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTappedimageView))
        $0.isUserInteractionEnabled = true // 사용자 상호작용을 가능하게 설정
        $0.addGestureRecognizer(tapGesture)
    }
    
    private let selectImageButton = UIButton().then {
        $0.setImage(UIImage(named: "AddImageButton"), for: .normal)
        $0.addTarget(self, action: #selector(didSelectedImage), for: .touchUpInside)
    }

    private let deleteMethodLabel = UILabel().then {
        $0.text = "이미지 클릭 시, 삭제됩니다"
        $0.font = .medium(size: 12)
        $0.textColor = .gray300
    }
    
    private let maximumWordLabel: UILabel = {
        let label = UILabel()
        label.text = "최대 300자"
        label.font = .medium(size: 12)
        label.textColor = .gray700
        return label
    }()

    private var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음 리뷰 작성하기", for: .normal)
        button.backgroundColor = .primary
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .semiBold(size: 18)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImagePickerDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }

    // MARK: - Functions
    
    override func configureUI() {
        dismissKeyboard()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(rateView,
                                menuLabel,
                                tasteLabel,
                                quantityLabel,
                                detailLabel,
                                tasteStackView,
                                quantityStackView,
                                userReviewTextView,
                                maximumWordLabel,
                                selectImageButton,
                                userReviewImageView,
                                deleteMethodLabel,
                                nextButton)
        
        tasteStackView.addArrangedSubviews([tasteLabel,
                                            tasteRateView])
        
        quantityStackView.addArrangedSubviews([quantityLabel,
                                               quantityRateView])
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(scrollView)
        }
        
        menuLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        rateView.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
            make.height.equalTo(36.12)
        }
    
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(rateView.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
        }
        
        tasteStackView.snp.makeConstraints { make in
            make.top.equalTo(detailLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        quantityStackView.snp.makeConstraints { make in
            make.top.equalTo(tasteStackView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(maximumWordLabel.snp.bottom).offset(132)
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(40)
        }
        
        for i in 0...4 {
            tasteRateView.buttons[i].snp.makeConstraints { make in
                make.height.equalTo(28)
                make.width.equalTo(29.3)
            }
            
            quantityRateView.buttons[i].snp.makeConstraints { make in
                make.height.equalTo(28)
                make.width.equalTo(29.3)
            }
        }
        
        userReviewTextView.snp.makeConstraints { make in
            make.top.equalTo(quantityStackView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(181)
        }
        
        maximumWordLabel.snp.makeConstraints { make in
            make.top.equalTo(userReviewTextView.snp.bottom).offset(7)
            make.trailing.equalTo(userReviewTextView)
        }
        
        selectImageButton.snp.makeConstraints {
            $0.top.equalTo(maximumWordLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        }
        
        userReviewImageView.snp.makeConstraints {
            $0.top.equalTo(maximumWordLabel.snp.bottom).offset(15)
            $0.leading.equalTo(selectImageButton.snp.trailing).offset(13)
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        }

        deleteMethodLabel.snp.makeConstraints {
            $0.top.equalTo(selectImageButton.snp.bottom).offset(7)
            $0.trailing.equalTo(userReviewTextView)
        }
    }
    
    override func setButtonEvent() {
        nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
    }
    
    override func customNavigationBar() {
        super.customNavigationBar()
        navigationItem.title = "리뷰 남기기"
    }
    
    func dataBind(list: [String]) {
        self.selectedList = list
    }
    
    func setImagePickerDelegate() {
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
    }
    
    // FIXME: - alert 추가
    
    @objc
    func tappedNextButton() {
        if selectedList.count == 1 {
            self.navigationController?.isNavigationBarHidden = false
            if let reviewViewController = self.navigationController?.viewControllers.first(where: { $0 is ReviewViewController }) {
                self.navigationController?.popToViewController(reviewViewController, animated: true)
                postWriteReview(mainGrade: rateView.currentStar, amountGrade: quantityRateView.currentStar, tasteGrade: tasteRateView.currentStar, content: userReviewTextView.text, image: [], menuId: 3)
            }
        } else {
            selectedList.remove(at: 0)
            let setRateVC = SetRateViewController()
            setRateVC.dataBind(list: selectedList)
            navigationController?.pushViewController(setRateVC, animated: true)
        }
    }
    
    // 키보드가 나타났다는 알림을 받으면 실행할 메서드
    @objc func keyboardWillShow(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 올려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let buttonHeight = nextButton.frame.size.height + 77
            self.view.frame.origin.y -= (keyboardHeight - buttonHeight)
            self.navigationController?.isNavigationBarHidden = true
        }
    }

    // 키보드가 사라졌다는 알림을 받으면 실행할 메서드
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 내려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let buttonHeight = nextButton.frame.size.height + 77
            self.view.frame.origin.y += (keyboardHeight - buttonHeight)
            self.navigationController?.isNavigationBarHidden = false
        }
    }
    
    // 노티피케이션을 추가하는 메서드
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // imagePicker
    @objc
    func didSelectedImage() {
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc
    func didTappedimageView() {
        userReviewImageView.image = nil // 이미지 삭제
    }
}

extension SetRateViewController {
    private func postWriteReview(mainGrade: Int, amountGrade: Int, tasteGrade: Int, content: String, image: [UIImage?], menuId: Int) {
        let param = WriteReviewRequest.init(mainGrade: mainGrade,
                                               amountGrade: amountGrade,
                                               tasteGrade: tasteGrade,
                                               content: content
        )
        self.writeReviewProvider.request(.writeReview(param: param, image: image, menuId: menuId)) { response in
            
            switch response {
            case.success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

extension SetRateViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userReviewImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
