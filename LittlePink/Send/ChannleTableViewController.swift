//
//  ChannleTableViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/13.
//

import UIKit
import XLPagerTabStrip

class ChannleTableViewController: UITableViewController {
  

    var channle = ""
    var subChannles:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subChannles.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let channleCell = tableView.dequeueReusableCell(withIdentifier: KSubChannleCellID, for: indexPath)
        channleCell.textLabel?.text = "# \(subChannles[indexPath.row])";
        channleCell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return channleCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let channleVC = parent as! ChannleViewController
        let subChannleString = subChannles[indexPath.row]
        channleVC.channleDelegate?.didSelectChannle(channle: self.channle, subChannle: subChannleString)
        dismiss(animated: true)
    }
}


extension ChannleTableViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: self.channle)
    }
    
}
