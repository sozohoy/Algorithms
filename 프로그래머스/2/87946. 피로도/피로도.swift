import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var leftPoint = k
    var arr = dungeons
    var isVisited: [Bool] = Array(repeating: false, count: dungeons.count)
    var result = 0
    
    func dfs(n: Int, leftPoint: Int, isVisited: [Bool]) -> Int {
        var currentVisited = isVisited
        var count = 1
        currentVisited[n] = true
        var currentLeftPoint = leftPoint - arr[n][1]
        var point = 0
        for i in 0..<arr.count {
            if currentLeftPoint >= arr[i][0] && currentVisited[i] == false {
                point = max(point, 
                            dfs(n: i, leftPoint: currentLeftPoint, isVisited: currentVisited))
            }
        }
        return count + point
    }
    
    for i in 0..<arr.count {
        result = max(result, dfs(n: i, leftPoint: leftPoint, isVisited: isVisited))
    }

    return result
}