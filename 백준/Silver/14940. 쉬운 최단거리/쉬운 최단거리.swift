let input = readLine()!.split(separator: " ").map { Int($0)! }
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var startX = 0
var startY = 0
var graph = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])
for i in 0..<input[0] {
    let elements = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<input[1] {
        if elements[j] == 2 {
            startX = i
            startY = j
        }
        graph[i][j] = elements[j]
    }
}
var distance = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])
var current = 0
var queue: [(Int, Int)] = []

func bfs(_ x: Int, _ y: Int) {
    queue.append((x,y))
    graph[x][y] = 0
    while !queue.isEmpty {
        let elements = queue.removeFirst()
        for i in 0..<4 {
            let nx = elements.0 + dx[i]
            let ny = elements.1 + dy[i]
            if nx < 0 || nx >= input[0] || ny < 0 || ny >= input[1] {
                continue
            }
            if graph[nx][ny] == 1 && distance[nx][ny] == 0 {
                queue.append((nx, ny))
                distance[nx][ny] = distance[elements.0][elements.1] + 1
            }
        }
    }
}

bfs(startX, startY)

for i in 0..<input[0] {
    for j in 0..<input[1] {
        if graph[i][j] == 1 && distance[i][j] == 0 {
            print(-1, terminator: " ")
        } else {
            print(distance[i][j], terminator: " ")
        }
    }
    print()
}