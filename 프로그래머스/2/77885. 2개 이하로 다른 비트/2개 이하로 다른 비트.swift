import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    
    var result: [Int64] = []
    
    // 16비트의 숫자
    for i in 0..<numbers.count {
        var target = String(numbers[i], radix: 2).map { String($0) }
        if !target.contains("0") {
            target.insert("0", at: 0)
        }
        for j in stride(from: target.count - 1, to: -1, by: -1) {
            if target[j] == "0" {
                if j == target.count - 1 {
                    target[j] = "1"
                } else {
                    target[j] = "1"
                    target[j + 1] = "0"
                }
                break
            }
        }
        var targetNum = Int(target.joined(separator: ""), radix: 2)!
        result.append(Int64(targetNum))
    }
    return result
}