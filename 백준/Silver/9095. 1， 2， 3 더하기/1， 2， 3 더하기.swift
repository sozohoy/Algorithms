var arr = Array(repeating: 0, count: 11)
arr[0] = 0
arr[1] = 1
arr[2] = 2
arr[3] = 4
for i in 4..<arr.count {
    arr[i] = arr[i - 1] + arr[i - 2] + arr[i - 3]
}
let input = Int(readLine()!)!
for _ in 0..<input {
    let num = Int(readLine()!)!
    print(arr[num])
}