import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var isVisited: [Bool] = Array(repeating: false, count: n + 1)
    var result = 0
    for i in 0..<n {
        for j in i + 1..<n {
            if computers[i][j] == 1 && computers[j][i] == 1 {
                graph[i + 1].append(j + 1)
                graph[j + 1].append(i + 1)
            }
        }
    }
    
    func dfs(n: Int) {
        isVisited[n] = true
        for i in 0..<graph[n].count {
            if isVisited[graph[n][i]] == false {
                dfs(n: graph[n][i])
            }
        }
    }
    
    for i in 1..<graph.count {
        if isVisited[i] == false {
            result += 1
            dfs(n: i)
        }
    }
    
    return result
}