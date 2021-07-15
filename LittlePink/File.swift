//
//  File.swift
//  LittlePink
//
//  Created by fengshuo on 2021/5/8.
//

import UIKit

let KNearVCId = "NearViewControllerID"
let KFocusVCId = "FocusViewControllerID"
let KDiscoverId = "DiscoverViewControllerID"
let kDynamicSendID = "kDynamicSendID"
let KWalterFallId = "KWalterFallId"
let KPhotoCellID = "PhotoCellID"
let KAddPhotoViewID = "AddPhotoViewID";
//Mark- CellID
let KWalterFallCellId = "WallterFallCellID"

let KWalterFallPadding : CGFloat = 4
let KMaxCountPhotoCount = 9
let KMaxTitleCount = 20
let KMaxTextCount = 10

let KChannleVCID = "ChannleVCID"
let KSubChannleCellID = "SubChannleCellID"
let KPOITableViewCellID = "POITableViewCellID"

let kChannels = ["推荐","旅行","娱乐","才艺","美妆","白富美","美食","萌宠"]
//话题
let kAllSubChannels = [
    ["穿神马是神马", "就快瘦到50斤啦", "花5个小时修的靓图", "网红店入坑记"],
    ["魔都名媛会会长", "爬行西藏", "无边泳池只要9块9"],
    ["小鲜肉的魔幻剧", "国产动画雄起"],
    ["练舞20年", "还在玩小提琴吗,我已经尤克里里了哦", "巴西柔术", "听说拳击能减肥", "乖乖交智商税吧"],
    ["粉底没有最厚,只有更厚", "最近很火的法属xx岛的面霜"],
    ["我是白富美你是吗", "康一康瞧一瞧啦"],
    ["装x西餐厅", "网红店打卡"],
    ["我的猫儿子", "我的猫女儿", "我的兔兔"]
]

let kNoPOIPH = "未知地点"
let kPOITypes = "医疗保健服务" //调试用
let kPOIsInitArr = [["不显示位置", ""]]
let kPOIsOffset = 20
