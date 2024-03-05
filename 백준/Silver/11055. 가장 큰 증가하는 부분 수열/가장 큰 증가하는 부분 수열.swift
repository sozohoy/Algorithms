import Foundation

let input = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: 0, count: input + 1)
result[0] = arr[0]

for i in 1..<arr.count {
    result[i] = arr[i]
    for j in 0..<i {
        if arr[i] > arr[j] {
            result[i] = max(result[i], result[j] + arr[i])
        }
    }
}

print(result.max()!)