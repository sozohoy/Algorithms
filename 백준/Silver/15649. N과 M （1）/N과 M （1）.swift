import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

var arr: [Int] = []

func dfs() {
    if arr.count == input[1] {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 1...input[0] {
        if !arr.contains(i) {
            arr.append(i)
            dfs()
            arr.removeLast()
        }
    }
}

dfs()