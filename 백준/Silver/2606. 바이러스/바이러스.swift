import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: n + 1)
var isVisited: [Bool] = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let element = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[element[0]].append(element[1])
    graph[element[1]].append(element[0])
}

func dfs(start: Int) {
    isVisited[start] = true

    for i in graph[start] {
        if !isVisited[i] {
            dfs(start: i)
        }
    }
}
dfs(start: 1)
var result = isVisited.filter { $0 == true }.count - 1
print(result)