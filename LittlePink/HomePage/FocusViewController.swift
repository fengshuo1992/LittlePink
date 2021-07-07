//
//  FocusViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/5/8.
//

import UIKit
import XLPagerTabStrip

class FocusViewController: UIViewController, IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
      return IndicatorInfo(title: "关注")
    }

}
