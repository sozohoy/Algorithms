import Foundation

let count = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: "", count: count), count: count)
var isVisited = Array(repeating: Array(repeating: false, count: count), count: count)
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

for i in 0..<arr.count {
    let input = readLine()!.map { String($0) }
    for j in 0..<input.count {
        arr[i][j] = input[j]
    }
}

func dfs(x: Int, y: Int, color: String, type: Bool) {
    var oppositeColor: String?
    if type && color != "B" {
        oppositeColor = color == "R" ? "G" : "R"
    }
    isVisited[x][y] = true
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx < 0 || nx >= count || ny < 0 || ny >= count {
            continue
        }
        if type && color != "B" {
            if (arr[nx][ny] == color || arr[nx][ny] == oppositeColor!) && isVisited[nx][ny] == false {
                dfs(x: nx, y: ny, color: color, type: type)
            }
        } else {
            if arr[nx][ny] == color && isVisited[nx][ny] == false {
                dfs(x: nx, y: ny, color: color, type: type)
            }
        }
    }
}

var result = 0
var typeResult = 0
let colors = ["R", "G", "B"]

for k in 0..<colors.count {
    for i in 0..<count {
        for j in 0..<count {
            if arr[i][j] == colors[k] && isVisited[i][j] == false {
                dfs(x: i, y: j, color: colors[k], type: false)
                result += 1
            }
        }
    }
}

isVisited = Array(repeating: Array(repeating: false, count: count), count: count)

for k in 0..<colors.count {
    for i in 0..<count {
        for j in 0..<count {
            if arr[i][j] == colors[k] && isVisited[i][j] == false {
                dfs(x: i, y: j, color: colors[k], type: true)
                typeResult += 1
            }
        }
    }
}

print("\(result) \(typeResult)")