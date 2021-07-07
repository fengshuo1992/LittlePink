import UIKit


struct PersonS{
    var name = "冯硕"
    var age = 30
}

let p1 = PersonS()
var p2 = p1
p2.age = 40
p1.age


class PersonC {
    var name = "冯硕"
    var age = 20
}

let p3 = PersonC()
let p4 = p3
p4.age = 80
p3.age
