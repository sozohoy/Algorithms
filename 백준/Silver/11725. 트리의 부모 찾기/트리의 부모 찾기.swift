let input = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: 0), count: input + 1)
var isVisited = Array(repeating: false, count: input + 1)
var parent = Array(repeating: 0, count: input + 1)

for _ in 1...input - 1 {
    let element = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[element[0]].append(element[1])
    graph[element[1]].append(element[0])
    graph[element[0]].sort()
    graph[element[1]].sort()
}

func dfs(_ node: Int) {
    isVisited[node] = true
    for i in 0..<graph[node].count {
        if !isVisited[graph[node][i]] {
            parent[graph[node][i]] = node
            dfs(graph[node][i])
        }
    }
}

dfs(1)
for i in 2..<parent.count {
    print(parent[i])
}