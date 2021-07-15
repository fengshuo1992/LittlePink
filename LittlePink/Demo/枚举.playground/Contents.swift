import UIKit

enum CompassPoint : Int  {
    case north = 1, west, south, east
}

var dir = CompassPoint.east.rawValue

CompassPoint(rawValue: 2)


enum PlantTye: CaseIterable {
    case plantType_name, plantType_age, plantType_old, plantType_year, plantType_mouth
}

PlantTye.allCases.count

for type in PlantTye.allCases {
    print(type)
}

//enum Barcode {
//    case upc(Int, Int, Int)
//    case qrCode(String)
//}
//
//var codeproduct = Barcode.upc(10, 10, 1000)
//codeproduct = .qrCode("nagem")

//switch code {
//case let .upc(age, day, year):
//    print("\(age), \(day), \(year)")
//case .qrCode(let name):
//    print("\(name)")
//}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}


func guardGood(age:Int?) {
    guard let age = age, age > 0 else {return}
    print("\(age)")
}

//func ifBad(age:Int?) {
//    if age == nil || age ?? <#default value#> <= 0 {
//      return
//    }
//    print("nihao\(age)")
//}
//
//func fooManualCheck(x: Int?) {
//    if x == nil || x ?? 0 <= 0 {
//        // 不符合值的要求时，写点代码
//        return
//    }
//
//    // 使用x
//    x!.description
//}

guardGood(age: 10)
//ifBad(age: 1)


class Persong : NSObject {
    var _firstName:String?
    var lastName:String?
    var totalName:String?
    
    var firstName:String? {
        set{
        _firstName = newValue
        }
        
        get{
            _firstName
        }
    }
    
}

class People : NSObject {
    var _title:String?

    var title:String? {
        set{
            _title = newValue
        }

        get{
            return _title
        }

    }
}
