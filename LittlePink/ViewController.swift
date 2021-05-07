//
//  ViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/5/7.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var button = UIButton.init(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
      
        button.backgroundColor = .red
    }


}

