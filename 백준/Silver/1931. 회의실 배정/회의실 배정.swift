import Foundation

let input = Int(readLine()!)!
var arr: [(Int, Int)] = []
var result = 1
for _ in 0..<input {
    let num = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((num[0], num[1]))
}
arr.sort { pre, next in
    if pre.1 == next.1 {
        return pre.0 < next.0
    } else {
        return pre.1 < next.1
    }
}
var current = arr[0]

for i in 1..<arr.count {
    if arr[i].0 >= current.1 {
        result += 1
        current = arr[i]
    }
}
print(result)