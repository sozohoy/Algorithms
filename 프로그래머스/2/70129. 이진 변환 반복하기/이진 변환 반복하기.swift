import Foundation

func solution(_ s:String) -> [Int] {
    var removeString: String = s
    var result = 0
    var zeroCount = 0
    
    while removeString != "1" {
        result += 1
        for item in removeString {
            if item == "0" {
                zeroCount += 1
            }
        }
        removeString = removeString.replacingOccurrences(of: "0", with: "")
        removeString = String(removeString.count, radix: 2)
    }
    return [result, zeroCount]
} 