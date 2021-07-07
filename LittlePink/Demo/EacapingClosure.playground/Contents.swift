import UIKit


var completionHandles : [() -> ()] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> ()){
    completionHandles.append(completionHandler)
}

someFunctionWithEscapingClosure {
    
}

someFunctionWithEscapingClosure {
    
}
