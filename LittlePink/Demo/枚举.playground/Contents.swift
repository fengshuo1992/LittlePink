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
