//
//  DiscoverViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/5/8.
//

import UIKit
import XLPagerTabStrip

class DiscoverViewController: ButtonBarPagerTabStripViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14)
        settings.style.buttonBarBackgroundColor = .clear
   
    
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemLeftRightMargin = 2
        settings.style.selectedBarHeight = 0;
        super.viewDidLoad()

        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
      return IndicatorInfo(title: "发现")
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs:[WalterFallVC] = []
        for channlew in kChannels {
            let walterFallVC = storyboard!.instantiateViewController(identifier: KWalterFallId) as! WalterFallVC
            walterFallVC.channle = channlew
            vcs.append(walterFallVC)
        }
        return vcs
    }

}
