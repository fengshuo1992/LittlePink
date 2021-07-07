//
//  AddPhotoView.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/2.
//

import UIKit

class AddPhotoView: UICollectionReusableView {
        
    @IBOutlet weak var addPhotoBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoBtn.layer.borderWidth = 1
        addPhotoBtn.layer.borderColor = UIColor.tertiaryLabel.cgColor
    }
}
