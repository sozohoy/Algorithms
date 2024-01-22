let n = Int(readLine()!)!
let dx = [-1, -1, -1, 0, 0, 1, 1, 1]
let dy = [-1, 0, 1, -1, 1, -1, 0, 1]
var arr = Array(repeating: Array(repeating: "", count: n), count: n)
var mineOpened = false

for i in 0..<n {
    let input = readLine()!.compactMap { String($0) }
    for j in 0..<n {
        arr[i][j] = input[j]
    }
}
for i in 0..<n {
    let input = readLine()!.compactMap { String($0) }
    for j in 0..<input.count {
        if input[j] == "x" && arr[i][j] != "*" {
            arr[i][j] = input[j]
        }
        if input[j] == "x" && arr[i][j] == "*" {
            mineOpened = true
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if arr[i][j] == "x" {
            var count = 0
            for k in 0..<dx.count {
                let nx = i + dx[k]
                let ny = j + dy[k]
                if nx < 0 || nx >= n || ny < 0 || ny >= n {
                    continue
                }
                if arr[nx][ny] == "*" {
                    count += 1
                }
            }
            arr[i][j] = "\(count)"
        }
    }
}

for i in 0..<n {
    if mineOpened {
        print(arr[i].joined(separator: ""))
    } else {
        print(arr[i].map {
            if $0 == "*" {
                return "."
            }
            return $0
        }.joined(separator: ""))
    }
}