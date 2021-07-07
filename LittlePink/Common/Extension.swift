//
//  Extension.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/1.
//

import UIKit

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
