let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0], c = input[1], n = input[2]
var arr = Array(repeating: Array(repeating: "", count: c), count: r)
var isVisited = Array(repeating: Array(repeating: "O", count: c), count: r)
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

for i in 0..<r {
    let line = readLine()!.compactMap { String($0) }
    for j in 0..<c {
        arr[i][j] = line[j]
    }
}

func bfs(x: Int, y: Int) {
    isVisited[x][y] = "."
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx < 0 || nx >= r || ny < 0 || ny >= c {
            continue
        }
        if isVisited[nx][ny] == "O" {
            isVisited[nx][ny] = "."
        }
    }
}

if n == 1 {
    print(arr.map { $0.map { $0 }.joined(separator: "")}.joined(separator: "\n"))
} else if n % 2 == 0 {
    print(isVisited.map { $0.map { $0 }.joined(separator: "")}.joined(separator: "\n"))
} else if n > 1 {
    for i in 0..<r {
        for j in 0..<c {
            if arr[i][j] == "O" {
                bfs(x: i, y: j)
            }
        }
    }
    if n % 4 == 1 {
        arr = isVisited
        isVisited = Array(repeating: Array(repeating: "O", count: c), count: r)
        for i in 0..<r {
            for j in 0..<c {
                if arr[i][j] == "O" {
                    bfs(x: i, y: j)
                }
            }
        }
        print(isVisited.map { $0.map { $0 }.joined(separator: "")}.joined(separator: "\n"))
    } else if n % 4 == 3 {
        print(isVisited.map { $0.map { $0 }.joined(separator: "")}.joined(separator: "\n"))
    }
}