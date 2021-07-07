import UIKit


class Auther {
    var name:String!
     var video:Video?
    init(name:String) {
        self.name = name
    }
    
    deinit {
        print("auther对象被销毁了")
    }
}

class Video {
   unowned var auther: Auther!
    init(auther:Auther) {
        self.auther = auther
    }
    
    deinit {
        print("video对象被销毁了")
    }
}


var auther:Auther? = Auther(name: "冯硕")
var video:Video? = Video(auther: auther!)
auther?.video = video
auther = nil
video = nil

