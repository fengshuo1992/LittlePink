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
    
    static func loadView<T>(fromNib name:String, with type:T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        fatalError("loadview 不存在\(name)")
    }
}
