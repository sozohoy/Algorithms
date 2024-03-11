import Foundation

// 소수 변환 -> N, radix: k
func solution(_ n:Int, _ k:Int) -> Int {
    var num = String(n, radix: k).map { String($0) }
    var result: Int = 0
    var currentNum: String = ""
    for i in 0..<num.count {
        if num[i] == "0" {
            if isPrime(n: Int(currentNum) ?? 0) {
                result += 1
            }
            currentNum = ""
        } else {
            currentNum += num[i]    
        }
    }
    
    if currentNum != "" {
        if isPrime(n: Int(currentNum)!) {
            result += 1
        }
    }
    
    return result
}

func isPrime(n: Int) -> Bool {
    if n < 2 {
        return false
    }
    
    for i in 2..<Int(sqrt(Double(n)) + 1) {
        if n % i == 0 {
            return false
        }
    }
    
    return true
}