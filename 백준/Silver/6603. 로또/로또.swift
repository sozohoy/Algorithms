import Foundation

while true {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    if input.first == 0 {
        break
    } else {
        input.removeFirst()
    }
    var arr: [Int] = []
    func dfs(_ num: Int) {
        if arr.count == 6 {
            print(arr.map { String($0) }.joined(separator: " "))
        }

        for i in num..<input.count {
            if !arr.contains(input[i]) {
                arr.append(input[i])
                dfs(i + 1)
                arr.removeLast()
            }
        }
    }
    dfs(0)
    print("")
}