let readline = readLine()!.split(separator: " ").map { Int($0)! }
var graph: [[Int]] = Array(repeating: [], count: readline[0] + 1)
var isVisited: [Bool] = Array(repeating: false, count: readline[0] + 1)
for _ in 1...readline[1] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
    graph[input[0]].sort()
    graph[input[1]].sort()
}

func dfs(n: Int) {
    isVisited[n] = true
    print(n, terminator: " ")
    for i in 0..<graph[n].count {
        if isVisited[graph[n][i]] == false {
            dfs(n: graph[n][i])
        }
    }
}

dfs(n: readline[2])
isVisited = Array(repeating: false, count: readline[0] + 1)
print("")

func bfs(n: Int) {
    var queue: [Int] = [readline[2]]
    isVisited[n] = true
    print(n, terminator: " ")
    while !queue.isEmpty {
        let element = queue.removeFirst()
        for i in 0..<graph[element].count {
            if isVisited[graph[element][i]] == false {
                print(graph[element][i], terminator: " ")
                isVisited[graph[element][i]] = true
                queue.append(graph[element][i])
            }
        }
    }
}

bfs(n: readline[2])