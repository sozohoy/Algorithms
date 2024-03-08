import Foundation

func solution(_ s: String) -> Bool {
    
    var resultStack: [String] = []
    var bracket = s.map { String($0) }
    var result = false
    
    if s.first! == ")" || s.last! == "(" {
        return false
    }
    
    for i in 0..<bracket.count {
        if bracket[i] == "(" {
            resultStack.append(bracket[i])
        } else {
            if !resultStack.isEmpty {
                resultStack.removeLast()
            } else { 
                return false
            }
        }
    }

    return resultStack.isEmpty ? true : false
}