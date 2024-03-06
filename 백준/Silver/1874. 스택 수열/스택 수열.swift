import Foundation

let input = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<input {
    arr.append(Int(readLine()!)!)
}
var stack: [Int] = [1]
var result: [String] = ["+"]
var num = 2

while !arr.isEmpty {
    if stack.last == arr.first {
        result.append("-")
        stack.removeLast()
        arr.removeFirst()
    } else {
        if num == input + 1 {
            break
        } else {
            stack.append(num)
            result.append("+")
            num += 1
        }
    }
}
print(stack.isEmpty ? result.joined(separator: "\n") : "NO")