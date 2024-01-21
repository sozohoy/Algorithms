var arr: [Int] = []
var input = Int(readLine()!)!

for _ in 0..<input {
    let command = readLine()!.split(separator: " ").map { String($0) }
    switch command[0] {
    case "push_front":
        arr.insert(Int(command[1])!, at: 0)
    case "push_back":
        arr.append(Int(command[1])!)
    case "pop_front":
        print(arr.isEmpty ? -1 : arr.removeFirst())
    case "pop_back":
        print(arr.isEmpty ? -1 : arr.removeLast())
    case "size":
        print(arr.count)
    case "empty":
        print(arr.isEmpty ? 1 : 0)
    case "front":
        print(arr.isEmpty ? -1 : arr.first!)
    case "back":
        print(arr.isEmpty ? -1 : arr.last!)
    default:
        print("")
    }
}