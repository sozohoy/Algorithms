let input = Int(readLine()!)!
var t = Array(repeating: 0, count: input + 1)
var p = Array(repeating: 0, count: input + 1)
var dp = Array(repeating: 0, count: input + 1)
for i in 0..<input {
    let tp = readLine()!.split(separator: " ").map { Int(String($0))! }
    t[i] = tp[0]
    p[i] = tp[1]
}

for i in stride(from: input - 1, through: 0, by: -1) {
    if i + t[i] < input + 1 {
        dp[i] = p[i] + dp[t[i] + i..<dp.count].max()!
    }
}

print(dp.max()!)