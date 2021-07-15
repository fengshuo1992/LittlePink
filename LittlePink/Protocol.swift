//
//  Protocol.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/13.
//

import Foundation


protocol ChannleVCDelegate {
    
    /// 点击了item 传回代理
    /// - Parameters:
    ///   - channle: channle
    ///   - subChannle: 副标题
    func didSelectChannle(channle:String, subChannle:String)
}
