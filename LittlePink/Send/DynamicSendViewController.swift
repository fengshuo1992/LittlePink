//
//  DynamicSendViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/1.
//

import UIKit
import KMPlaceholderTextView


class DynamicSendViewController: UIViewController {
    var photos: [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!];
    var photoCount : Int {photos.count }
    var videoUrl:URL  = URL(fileURLWithPath: Bundle.main.path(forResource: "testVideo", ofType: "mp4")!)
    var isVideo:Bool {videoUrl != nil}
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var textView: KMPlaceholderTextView!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var titleTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dragInteractionEnabled = true
        dismissWhenTapView()
        let padding = textView.textContainer.lineFragmentPadding
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: -padding)
//        textView.textContainer.lineFragmentPadding = 0
        let paragraphStyle = NSMutableParagraphStyle()
        ///这个是 行高的倍数
//        paragraphStyle.lineHeightMultiple = 2;
        ///这个是行间距
        paragraphStyle.lineSpacing = 8;
        let typingAttributes : [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .backgroundColor: UIColor.secondaryLabel,
            .paragraphStyle : paragraphStyle
        ]
            
        
        textView.typingAttributes =  typingAttributes
        textView.tintColorDidChange()
    }
    
    
    @IBAction func textFiledChange(_ sender: Any) {
        ///如果文本高亮的时候 直接返回
        guard titleTextFiled.markedTextRange == nil else { return}
        
        if titleTextFiled.unwrappedText.count > KMaxTitleCount {
          
            titleTextFiled.text = String(titleTextFiled.unwrappedText.prefix(KMaxTitleCount))
            DispatchQueue.main.async {
                let end = self.titleTextFiled.endOfDocument
                self.titleTextFiled.selectedTextRange = self.titleTextFiled.textRange(from: end, to: end)
            }
        }
        
        titleCountLabel.text = "\(20 - titleTextFiled.unwrappedText.count)"
    }
    
    @IBAction func textFiledEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
    }
    
    
    @IBAction func textFiledEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
}

