import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let array: [Int] = queue1 + queue2
    var start = 0
    var end = queue1.count
    var result = 0
    var queue1Point = queue1.reduce(0, +)
    let queue2Point = queue2.reduce(0, +)
    let goal = (queue1Point + queue2Point) / 2
    
    if (queue1Point + queue2Point) % 2 != 0 {
        return -1
    }
    if goal < queue1.max()! || goal < queue2.max()! {
        return -1
    }
    
    while end < array.count && start <= end {
        if queue1Point < goal {
            queue1Point += array[end]
            end += 1
        } else if queue1Point > goal {
            queue1Point -= array[start]
            start += 1
        } else {
            break
        }
        result += 1
    }
    
    if queue1Point != goal {
        return -1
    }
    
    return result
}