//
//  LPInputAccView.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/8.
//

import UIKit

class LPInputAccView: UIView {

    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var countStackView: UIStackView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
   
    
    var currentCount: Int = 0 {
        didSet{
            if currentCount > KMaxTitleCount {
                completeButton.isHidden = true
                countStackView.isHidden = false
                currentLabel.text  = "\(currentCount)"
            } else {
                completeButton.isHidden = false
                countStackView.isHidden = true
            }
        }
    }

}
