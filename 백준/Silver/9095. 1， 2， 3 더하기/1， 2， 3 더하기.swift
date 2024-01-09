var arr = [0, 1, 2, 4]
for i in 4..<11 {
    arr.append(arr[i - 1] + arr[i - 2] + arr[i - 3])
}
let input = Int(readLine()!)!
for _ in 0..<input {
    let num = Int(readLine()!)!
    print(arr[num])
}