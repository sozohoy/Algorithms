let input = Int(readLine()!)!
var dp = Array(repeating: 0, count: 90)
dp[0] = 1
dp[1] = 1
if input > 2 {
    for i in 2..<input {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
}
print(dp[input - 1])