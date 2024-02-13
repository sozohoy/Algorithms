let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }
var start = 0
var end = arr.last!
var result = 0

while start <= end {
    let mid = (start + end) / 2
    var count = 0
    for i in 0..<arr.count {
        if arr[i] > mid {
            count += (arr[i] - mid)
        }
    }
    if count < m {
        end = mid - 1
    } else {
        start = mid + 1
        result = mid
    }
}

print(result)