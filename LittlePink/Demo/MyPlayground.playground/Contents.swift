import UIKit

var str = "Hello, playground"

func appName(lan:String) -> String{
    print("今天学习了+\(lan)")
    return "aaaaa"
}

func appName1() -> String{
    print("今天学习了闭包")
    return "aaaaa"
}
 
 
appName(lan: "ios")
let explain = { () -> () in
    print("这是一个没有参数没有返回值的闭包")
}
explain()

func codeSign(age:Int, appCode:() -> String){
    print("今年多大的\(age), 名字叫啥\(appCode())")
}

codeSign(age: 10) { () -> String in
    return "枫树"
}

codeSign(age: 15, appCode: appName1)

///尾随闭包
codeSign(age: 10) { () -> String in
    "你好世界"
}

func codeSign(age:Int, appName:String, res:(Int,String) -> String){
    print("我今年\(age)岁了,\(res(1, "AFNetworking")), 做成了\(appName)")
}
codeSign(age: 10, appName: "小红书") { (day, third) -> String in
    "学习\(day)天, 使用了\(third)这第三方库"
}

let nameBlock =  { () -> String in
    "aaaaaa";
}

let name = nameBlock()
print(name)


func  codeSwift(day:Int,program: () ->String) {
   print(("学习swift的第\(day), 写了\(program())"))
}

codeSwift(day:10, program: { () -> String in
    "写了很久闭包"
})


codeSwift(day:10) { () -> String in
    "简写的尾随闭包"
}


codeSwift(day: 5) { () -> String in
    "写了小红书这个app"
}

func codingSwift(appname: () -> String){
    
}


func codingSwift(day:Int, prams:(Int, String) ->String){
    print("学习swift\(day), \(prams(19, "冯硕"))")
}

codingSwift(day: 4) {
    "今年多大了\($0), 名字叫\($1)"
}
