import Foundation

var n = Int(readLine()!)!
var num = Int(sqrt(Double(n)))

func checkNum(_ n: Int) {
    if Double(Int(sqrt(Double(n)))) == sqrt(Double(n)) {
        print(1)
        return
    } else {
        for i in 1...num {
            let result = Double(Int(sqrt(Double(n) - pow(Double(i), 2))))
            let originalResult = sqrt(Double(n) - pow(Double(i), 2))
            if result == originalResult {
                print(2)
                return
            }
        }
        for i in 1...num {
            for j in 1...Int(sqrt(Double(n) - pow(Double(i), 2))) {
                let result = Double(Int(sqrt(Double(n) - pow(Double(i), 2) - pow(Double(j), 2))))
                let originalResult = sqrt(Double(n) - pow(Double(i), 2) - pow(Double(j), 2))
                if result == originalResult {
                    print(3)
                    return
                }
            }
        }
        print(4)
    }
}

checkNum(n)