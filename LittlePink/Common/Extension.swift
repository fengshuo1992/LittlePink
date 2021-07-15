//
//  Extension.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/1.
//

import UIKit

extension String {
    ///去掉空格之后是否还是空白的
    var isBlank:Bool {
        ///字符串替换
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

extension Optional where Wrapped == String {
    var unwrappedText: String { self ?? ""}
}

extension UITextField {
    var unwrappedText:String {text ?? ""}
}

extension UIView {
    @IBInspectable
    var redius :CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }
}

extension UIViewController {
    func dismissWhenTapView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(recogizner))
        tap.cancelsTouchesInView = false;
        view.addGestureRecognizer(tap);
    }
    
    @objc func recogizner() {
        view.endEditing(true)
    }
}


extension UIViewController {
    func hudText(_ text: String, _ subTitle: String? = nil) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
    }
}
