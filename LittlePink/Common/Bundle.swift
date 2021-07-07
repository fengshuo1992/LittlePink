//
//  Bundle.swift
//  LittlePink
//
//  Created by fengshuo on 2021/5/18.
//

import Foundation

extension Bundle {
    var appname:String {
        if let appname = localizedInfoDictionary?["CFBundleDisplayName"] as? String {
          return  appname
        } else {
           return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}
