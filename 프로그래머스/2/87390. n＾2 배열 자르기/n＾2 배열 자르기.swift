import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var arr: [Int] = []
    
    for i in Int(left)...Int(right) {
        let x = i / n + 1
        let y = i % n + 1
        arr.append(max(x, y))
    }
    
    return arr
}