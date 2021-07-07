//
//  HomePageViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/5/8.
//

import UIKit
import XLPagerTabStrip

class HomePageViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarLeftContentInset = 115
        settings.style.buttonBarRightContentInset = 115
        
        
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemLeftRightMargin = 2
        settings.style.selectedBarBackgroundColor = UIColor(named: "MainColor")!
        settings.style.selectedBarHeight = 2;
        super.viewDidLoad()

        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
        
    }
  

   
    

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let discoverVC = storyboard!.instantiateViewController(identifier: KDiscoverId)
        let nearVC = storyboard!.instantiateViewController(identifier: KNearVCId)
        let focusVC = storyboard!.instantiateViewController(identifier: KFocusVCId)
        return [discoverVC, nearVC, focusVC]
    }

}
