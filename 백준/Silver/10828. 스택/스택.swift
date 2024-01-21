import Foundation

var arr: [Int] = []
var input = Int(readLine()!)!

for _ in 0..<input {
    let command = readLine()!
    if command.contains(" ") {
        let splitCommand = command.split(separator: " ")
        arr.append(Int(String(splitCommand[1]))!)
    } else {
        switch command {
        case "top":
            print(arr.last ?? -1)
        case "size":
            print(arr.count)
        case "empty":
            print(arr.isEmpty ? 1 : 0)
        case "pop":
            if !arr.isEmpty {
                print(arr.removeLast())
            } else {
                print(-1)
            }
        default:
            print("error")
        }
    }
}