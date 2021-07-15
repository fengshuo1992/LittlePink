//
//  Dynamic_config.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/8.
//

import Foundation
extension DynamicSendViewController {
     func config(){
        collectionView.dragInteractionEnabled = true
        dismissWhenTapView()
        let padding = textView.textContainer.lineFragmentPadding
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: -padding)
//        textView.textContainer.lineFragmentPadding = 0
        let paragraphStyle = NSMutableParagraphStyle()
        ///这个是 行高的倍数
//        paragraphStyle.lineHeightMultiple = 2;
        ///这个是行间距
        paragraphStyle.lineSpacing = 8;
        let typingAttributes : [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .backgroundColor: UIColor.secondaryLabel,
            .paragraphStyle : paragraphStyle
        ]
            
        
        textView.typingAttributes =  typingAttributes
        textView.tintColorDidChange()
        let inputView = Bundle.loadView(fromNib: "LPInputAccView", with: LPInputAccView.self)
        textView.inputAccessoryView = inputView
        inputView.completeButton.addTarget(self, action: #selector(completeButtonAction), for: .touchUpInside)
        inputView.totalLabel.text = "/\(KMaxTextCount)"
        
        //请求定位权限
        locationManager.requestWhenInUseAuthorization()
    }
}



extension DynamicSendViewController {
    @objc func completeButtonAction() {
        textView.resignFirstResponder()
    }
}

