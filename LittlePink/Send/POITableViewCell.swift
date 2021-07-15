//
//  POITableViewCell.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/14.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    var contentArray = ["", ""]{
        didSet {
            cityLabel.text = contentArray[0]
            detailLabel.text = contentArray[1]
        }
    }
}
