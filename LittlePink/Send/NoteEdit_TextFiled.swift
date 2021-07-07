//
//  NoteEdit_TextFiled.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/6.
//

import Foundation

extension DynamicSendViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(range.location)
//        print(string)
//        let isExceed = range.location >= KMaxTitleCount  || (textField.unwrappedText.count + string.count >= KMaxTitleCount)
//            return !isExceed
//    }
    
}
