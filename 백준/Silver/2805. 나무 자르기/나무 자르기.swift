import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
let array = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

var start = 0
var end = array.last!
var result = 0

while start <= end {
    let mid = (start + end) / 2
    var count = 0
    for i in array {
        if i > mid {
            count += (i - mid)
        }
    }
    if count < m {
        end = mid - 1
    } else {
        result = mid
        start = mid + 1
    }
}

print(result)