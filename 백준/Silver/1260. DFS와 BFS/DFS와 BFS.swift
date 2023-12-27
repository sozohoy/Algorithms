import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var graph = [[Int]](repeating: [], count: input[0] + 1)
var isVisited = [Bool](repeating: false, count: input[0] + 1)

for _ in 1...input[1] {
    let element = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[element[0]].append(element[1])
    graph[element[1]].append(element[0])
    graph[element[0]].sort()
    graph[element[1]].sort()
}

func dfs(start: Int) {
    isVisited[start] = true
    print(start, terminator: " ")
    for i in graph[start] {
        if !isVisited[i] {
            dfs(start: i)
        }
    }
}
dfs(start: input[2])
isVisited = Array(repeating: false, count: input[0] + 1)

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
print("")
var queue = Queue<Int>()

func bfs(start: Int) {
    isVisited[start] = true
    queue.enqueue(start)

    while !queue.isEmpty {
        guard let element = queue.dequeue() else { return }
        print(element, terminator: " ")
        for i in graph[element] {
            if !isVisited[i] {
                queue.enqueue(i)
                isVisited[i] = true
            }
        }
    }
}

bfs(start: input[2])
