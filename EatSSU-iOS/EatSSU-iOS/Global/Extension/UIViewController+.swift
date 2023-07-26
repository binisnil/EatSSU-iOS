//
//  UIViewController+.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/02/13.
//

import SwiftUI
import UIKit.UIViewController

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif

extension UIViewController {
func dismissKeyboard() {
       let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
       tap.cancelsTouchesInView = false
       view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
       view.endEditing(true)
    }
    
    func presentBottomAlert(_ message: String) {
      
        let alertSuperview : UIView = {
            let view = UIView()
            view.backgroundColor = .darkGray.withAlphaComponent(0.85)
            view.layer.cornerRadius = 10
            view.isHidden = true
            return view
        }()
    
        
        let alertLabel : UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 15)
            label.textColor = .white
            label.text = message
            return label
        }()
        
        view.addSubview(alertSuperview)
        alertSuperview.addSubview(alertLabel)
        alertSuperview.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(35)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        alertLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        
        alertLabel.text = message
        alertSuperview.alpha = 1.0
        alertSuperview.isHidden = false
        
        UIView.animate(
            withDuration: 2.0,
            delay: 1.0,
            options: .curveEaseIn,
            animations: { alertSuperview.alpha = 0 },
            completion: { _ in
                alertSuperview.removeFromSuperview()
            }
        )
    }
}
