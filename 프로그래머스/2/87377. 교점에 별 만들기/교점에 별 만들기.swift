import Foundation

func solution(_ line:[[Int]]) -> [String] {
    
    var position: [(Int, Int)] = []
    
    for i in 0..<line.count - 1{
        for j in i..<line.count {
            if line[i][0] * line[j][1] - line[i][1] * line[j][0] != 0 {
                let modX = Int(line[i][1] * line[j][2] - line[i][2] * line[j][1]) % (line[i][0] * line[j][1] - line[i][1] * line[j][0])
                let modY = Int(line[i][2] * line[j][0] - line[i][0] * line[j][2]) % (line[i][0] * line[j][1] - line[i][1] * line[j][0])
                if modX == 0 && modY == 0 {
                    let x = Int(line[i][1] * line[j][2] - line[i][2] * line[j][1]) / (line[i][0] * line[j][1] - line[i][1] * line[j][0])
                    let y = Int(line[i][2] * line[j][0] - line[i][0] * line[j][2]) / (line[i][0] * line[j][1] - line[i][1] * line[j][0])
                    position.append((x, y))
                }
            }
        }
    }
    var maxX: Int = Int.min
    var minX: Int = Int.max
    var maxY: Int = Int.min
    var minY: Int = Int.max
    for i in 0..<position.count {
        maxX = max(maxX, position[i].0)
        minX = min(minX, position[i].0)
        maxY = max(maxY, position[i].1)
        minY = min(minY, position[i].1)
    }
    var arr = Array(repeating: Array(repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)

    for i in 0..<position.count {
        arr[position[i].1 - minY][position[i].0 - minX] = "*"
    }
    var result: [String] = []
    
    for arr in arr.reversed() { 
        result.append(arr.reduce("", +))
    }
    
    return result
}