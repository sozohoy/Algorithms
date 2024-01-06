let _ = readLine()!
let n = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
let _ = readLine()!
let m = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 0..<m.count {
    var start = 0
    var end = n.count - 1
    var result = 0
    while start <= end {
        let mid = (start + end) / 2
        if n[mid] == m[i] {
            result += 1
            break
        }
        if n[mid] > m[i] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    print(result)
}