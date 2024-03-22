import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var answer: [Int] = []
    var arr: [[Int]] = []
    var num = 1
    for i in 0..<rows {
        var columnsArr: [Int] = []
        for j in 0..<columns {
            columnsArr.append(num)
            num += 1
        }
        arr.append(columnsArr)
    }
    
    for i in 0..<queries.count {
        var startX = queries[i][0]
        var startY = queries[i][1]
        var currentX = startX - 1
        var currentY = startY - 1
        var endX = queries[i][2]
        var endY = queries[i][3] 
        var record = arr[currentX][currentY]
        var result: [Int] = []
        
        for _ in 0..<endY - startY {
            currentY += 1
            let next = arr[currentX][currentY]
            arr[currentX][currentY] = record
            record = next
            result.append(next)
        }
        
        for _ in 0..<endX - startX {
            currentX += 1 
            let next = arr[currentX][currentY]
            arr[currentX][currentY] = record
            record = next
            result.append(next)
        }
        
        for _ in 0..<endY - startY {
            currentY -= 1 
            let next = arr[currentX][currentY]
            arr[currentX][currentY] = record
            record = next
            result.append(next)
        }
        
        for _ in 0..<endX - startX {
            currentX -= 1
            let next = arr[currentX][currentY]
            arr[currentX][currentY] = record
            record = next
            result.append(next)
        }

        answer.append(result.min()!)
    }
    return answer
}