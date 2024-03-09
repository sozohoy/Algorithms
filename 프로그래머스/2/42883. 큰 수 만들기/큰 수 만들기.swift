import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let numbers: [String] = number.map { String($0) }
    var resultStringCount = numbers.count - k 
    var result = ""
    
    var checkIndex = 0
    var index = 0
    for i in stride(from: resultStringCount, to: 0, by: -1) {
        var maxCount = 0
        for j in checkIndex...numbers.count - i {
            if Int(numbers[j])! > maxCount {
                maxCount = Int(numbers[j])!
                index = j
            }
            if maxCount == 9 {  
                break    
            }
        }
        result += "\(maxCount)"
        
        checkIndex = index + 1
    }
    return result
}