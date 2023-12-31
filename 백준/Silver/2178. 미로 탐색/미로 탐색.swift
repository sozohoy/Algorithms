import Foundation

struct Queue<T> {
    var queue: [T] = []
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    var count: Int {
        queue.count
    }
    
    var front: T? {
        queue.first
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return queue.removeFirst()
        }
    }
}

let input: [Int] = (readLine()?.split(separator: " ").map { Int(String($0))! })!
let n = input[0], m = input[1]
var graph: [[String]] = Array(repeating: [], count: n)
var distance: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    let miro = readLine()!
    for j in miro {
        graph[i].append(j.description)
    }
}

let dx = [0, 0, 1, -1]
let dy = [1, -1 , 0 ,0]

func bfs(x: Int, y: Int) {
    var queue = Queue(queue: [(x, y)])
    graph[x][y] = "0"
    
    while !queue.isEmpty {
        let (x, y) = queue.dequeue()!
        for i in 0..<4 {
            let (nx, ny) = (x + dx[i], y + dy[i])
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            if graph[nx][ny] == "1" {
                queue.enqueue((nx, ny))
                graph[nx][ny] = "0"
                distance[nx][ny] = distance[x][y] + 1
            }
        }
    }
}
bfs(x: 0, y: 0)
print(distance[n - 1][m - 1] + 1)