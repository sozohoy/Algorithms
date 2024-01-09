let input = Int(readLine()!)!
var arr = Array(repeating: 0, count: input)
if input == 1 {
    print(1)
} else if input == 2 {
    print(2)
} else {
    arr[0] = 1
    arr[1] = 2
    for i in 2..<input {
        arr[i] = (arr[i - 1] + arr[i - 2]) % 10007
    }
    print(arr.last!)
}