//
//  ChannleViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/13.
//

import UIKit
import XLPagerTabStrip

class ChannleViewController: ButtonBarPagerTabStripViewController {

    var channleDelegate: ChannleVCDelegate?
    override func viewDidLoad() {
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        settings.style.buttonBarBackgroundColor = .clear
        
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemLeftRightMargin = 2
        settings.style.selectedBarBackgroundColor = UIColor(named: "MainColor")!
        settings.style.buttonBarItemTitleColor = .red
        settings.style.selectedBarHeight = 2;
        super.viewDidLoad()

    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var viewControllers: [UIViewController] = []
        for index in kChannels.indices {
            let channleTableVC =  storyboard!.instantiateViewController(identifier: KChannleVCID) as! ChannleTableViewController
                viewControllers.append(channleTableVC)
            channleTableVC.channle = kChannels[index]
            channleTableVC.subChannles = kAllSubChannels[index]
        }
        return viewControllers
    }

}
