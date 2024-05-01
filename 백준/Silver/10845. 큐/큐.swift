import Foundation

let input = Int(readLine()!)!
var arr: [Int] = []

for _ in 0..<input {
    let operation = readLine()!.split(separator: " ").map { String($0 )}
    switch operation[0] {
    case "push": arr.append(Int(operation[1])!)
    case "pop": print(arr.isEmpty ? -1 : arr.removeFirst())
    case "size": print(arr.count)
    case "empty": print(arr.isEmpty ? 1 : 0)
    case "front": print(arr.isEmpty ? -1 : arr.first!)
    case "back": print(arr.isEmpty ? -1 : arr.last!)
    default: break
    }
}