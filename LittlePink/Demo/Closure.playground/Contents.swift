import UIKit


let explain = {() -> () in
    print("hello word")
}

explain()

func codeingSwift(day: Int, program:() -> String) {
    print("学习swift\(day)天, 写了\(program())app")
}

codeingSwift(day: 7, program:{ () -> String in
  "这个是完整的带参数的"
})

codeingSwift(day: 7) { () -> String in
 "简化后的 最后一个参数的时候 可以不写参数的名字"
}

func codeSwift2(age:Int, params:(String,String) -> String) {
    print("这是我写的第二个闭包closure\(age), \(params("name", "22222"))")
}

codeSwift2(age: 10) { (name: String, sex: String) -> String in
    "这是一个叫\(name), 性别\(sex)的人"
}

codeSwift2(age: 79, params: +)



codeingSwift(day: 10, program: { () -> String in
    "你好"
})

// MARK: - 备注
// MARK: -- 有参数 没有返回值
func codeSwift3(age:Int, params:(String, Int) -> ()) {
    params("第一个参数", 4)
   print("有参数没有返回值的情况\(age)")
}

codeSwift3(age: 10, params:{ (name:String, age:Int) -> () in
   print("第一个参数是\(name), 第二个参数是\(age)")
})

codeSwift3(age: 19) { name, age in
    print("第一个参数是\(name), 第二个参数是\(age)")
}
codeSwift3(age: 35) {
    print("第一个参数是\($0), 第二个参数是\($1)")
}

// MARK: 逃逸闭包

class Book {
    var bookName = "学好swift"
    var demoEscape : (() -> ())?
    
    func readBook() {
        showName {
            print("一定好学些好swift")
        }
    }
    
    func showName(show: @escaping () -> ()) {
       show()
        self.demoEscape = show
    }
}

let learning =  Book()
learning.readBook()
learning.demoEscape!()

