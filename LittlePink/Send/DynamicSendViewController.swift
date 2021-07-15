//
//  DynamicSendViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/1.
//

import UIKit
import KMPlaceholderTextView

class DynamicSendViewController: UIViewController {
    let locationManager = CLLocationManager()
    var photos: [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!];
    var photoCount : Int {photos.count }
    var videoUrl:URL  = URL(fileURLWithPath: Bundle.main.path(forResource: "testVideo", ofType: "mp4")!)
    var isVideo:Bool {videoUrl != nil}
    var subChannle:String = ""
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var subChannleLabel: UILabel!
    
    @IBOutlet weak var subChannleStackView: UIStackView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var textView: KMPlaceholderTextView!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var titleTextFiled: UITextField!
    var textViewIAView: LPInputAccView{textView.inputAccessoryView as! LPInputAccView}
    override func viewDidLoad() {
        super.viewDidLoad()
      config()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let channleVC = segue.destination as? ChannleViewController {
            channleVC.channleDelegate = self
        }
    }
    
}

extension DynamicSendViewController:ChannleVCDelegate {
    func didSelectChannle(channle: String, subChannle: String) {
        self.subChannle = subChannle
        self.iconButton.tintColor = .blue
        self.topicLabel.text = self.subChannle
        self.topicLabel.textColor = .blue
        self.subChannleLabel.isHidden = true
    }
}

extension DynamicSendViewController:UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard textView.markedTextRange == nil else {return}
        textViewIAView.currentCount = textView.text.count
    }
}
