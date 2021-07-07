//
//  NearViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/5/8.
//

import UIKit
import XLPagerTabStrip

class NearViewController: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
      return IndicatorInfo(title: "附近")
    }
}
