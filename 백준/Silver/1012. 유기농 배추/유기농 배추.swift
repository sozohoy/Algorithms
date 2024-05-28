import Foundation

let repeatCount = Int(readLine()!)!

for _ in 0..<repeatCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: input[0]), count: input[1])
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var result = 0

    for _ in 0..<input[2] {
        let position = readLine()!.split(separator: " ").map { Int($0)! }
        arr[position[1]][position[0]] = 1
    }

    func dfs(x: Int, y: Int) {
        guard arr[x][y] != 0 else { return }
        arr[x][y] = 0
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || nx >= input[1] || ny < 0 || ny >= input[0] {
                continue
            }
            if arr[nx][ny] == 1 {
                dfs(x: nx, y: ny)
            }
        }
    }

    for i in 0..<input[1] {
        for j in 0..<input[0] {
            if arr[i][j] == 1 {
                dfs(x: i, y: j)
                result += 1
            }
        }
    }

    print(result)
}