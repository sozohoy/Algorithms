let input = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: input + 1)

for i in 0..<arr.count {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)