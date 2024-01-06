import Foundation

let input = Int(readLine()!)!
var results: [Int] = []

func binarySearch(_ array: [Int], num: Int) -> Int {
    var count = 0
    var start = 0
    var end = array.count - 1

    while start <= end {
        let mid = (start + end) / 2
        if array[mid] < num {
            start = mid + 1
            count = mid + 1
        } else {
            end = mid - 1
        }
    }
    return count
}

for _ in 0..<input {
    let _ = readLine()!
    let n = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    var result = 0
    for i in n {
        result += binarySearch(m, num: i)
    }
    results.append(result)
}

print(results.map { String($0) }.joined(separator: "\n"))