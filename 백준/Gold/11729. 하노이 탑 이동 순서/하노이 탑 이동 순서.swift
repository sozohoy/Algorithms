import Foundation
let N = Int(readLine()!)!
var answer = ""
var count = 0

func hanoi(num: Int, from: Int, to: Int, assist: Int) {
    if num == 1 {
        answer += "\(from) \(to)\n"
        count += 1
        return
    }
    
    hanoi(num: num - 1, from: from, to: assist, assist: to)
    answer += "\(from) \(to)\n"
    count += 1
    hanoi(num: num - 1, from: assist, to: to, assist: from)
}

hanoi(num: N, from: 1, to: 3, assist: 2)
print(count)
print(answer)