import Foundation

var gameCount = 1
let dx = [0, 0, 1, -1]
let dy = [1, -1 , 0 ,0]

while true {
    let size = Int(readLine()!)!
    if size == 0 { break }
    var arr = Array(repeating: Array(repeating: 0, count: size), count: size)
    var minPrice = Array(repeating: Array(repeating: 0, count: size), count: size)
    var isVisited = Array(repeating: Array(repeating: false, count: size), count: size)

    for i in 0..<size {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 0..<input.count {
            arr[i][j] = input[j]
        }
    }

    func bfs(x: Int, y: Int) {
        var queue: [(Int, Int)] = [(x, y)]
        minPrice[x][y] = arr[x][y]
        isVisited[x][y] = true

        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            for i in 0..<4 {
                let (nx, ny) = (x + dx[i], y + dy[i])
                if nx < 0 || nx >= size || ny < 0 || ny >= size {
                    continue
                }
                if !isVisited[nx][ny] {
                    queue.append((nx, ny))
                    isVisited[nx][ny] = true
                    minPrice[nx][ny] = minPrice[x][y] + arr[nx][ny]
                } else {
                    if minPrice[nx][ny] > minPrice[x][y] + arr[nx][ny] {
                        minPrice[nx][ny] = minPrice[x][y] + arr[nx][ny]
                        queue.append((nx, ny))
                    }
                }
            }
        }
    }

    bfs(x: 0, y: 0)
    print("Problem \(gameCount): \(minPrice[size - 1][size - 1])")
    gameCount += 1
}