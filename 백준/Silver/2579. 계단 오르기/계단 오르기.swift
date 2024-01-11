let input = Int(readLine()!)!
var arr = Array(repeating: 0, count: 300)
var dp = Array(repeating: 0, count: 300)

for i in 0..<input {
    arr[i] = Int(readLine()!)!
}

dp[0] = arr[0]
dp[1] = arr[0] + arr[1]
dp[2] = max(arr[0] + arr[2], arr[1] + arr[2])
if input > 3 {
    for i in 3..<input {
        dp[i] = max(arr[i] + arr[i - 1] + dp[i - 3], arr[i] + dp[i - 2])
    }
}

print(dp[input - 1])