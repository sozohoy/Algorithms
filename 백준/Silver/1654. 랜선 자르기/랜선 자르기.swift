let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = input[0], n = input[1]
var arr: [Int] = []
for _ in 0..<k {
    arr.append(Int(readLine()!)!)
}

var start = 1
var end = arr.max()!
var result = 0

while start <= end {
    var count = 0
    let mid = (start + end) / 2
    for i in 0..<arr.count {
        count += (arr[i] / mid)
    }
    
    if count < n {
        end = mid - 1
    } else {
        start = mid + 1
        result = mid
    }
}

print(result)