let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

func searchHigh(_ num: Int) -> Int {
    var start = 0
    var end = n - 1
    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] > num {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return end
}

func searchLow(_ num: Int) -> Int {
    var start = 0
    var end = n - 1
    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] < num {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return end
}

for _ in 0..<m {
    let result = readLine()!.split(separator: " ").map { Int($0)! }
    print(searchHigh(result[1]) - searchLow(result[0]))
}