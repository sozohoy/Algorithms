import Foundation

let dx = [1, -1, 0, 0]
let dy = [0, 0, -1, 1]

let n = Int(readLine()!)!
var graph: [[String]] = Array(repeating: [], count: n)
var result: [Int] = []
var x = 0, y = 0, count = 0

for i in 0..<n {
    let str = readLine()!
    for j in str {
        graph[i].append(j.description)
    }
}

func dfs(x: Int, y: Int) -> Int {
    guard graph[x][y] != "0" else { return 0 }
    var count = 1
    graph[x][y] = "0"
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx < 0 || nx >= n || ny < 0 || ny >= n {
            continue
        }
        if graph[nx][ny] == "1" {
            count += dfs(x: nx, y: ny)
        }
    }
    return count
}

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == "1" {
            result.append(dfs(x: i, y: j))
        }
    }
}

print(result.count)
result.sorted().forEach { print($0) }