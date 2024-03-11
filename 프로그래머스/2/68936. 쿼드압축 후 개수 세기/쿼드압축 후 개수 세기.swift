import Foundation

var one = 0
var zero = 0

func recursive(_ arr: [[Int]], _ row: Int, _ col: Int, _ n: Int) {
    var num = arr[row][col]
    
    for i in row..<row + n {
        for j in col..<col + n {
            if num != arr[i][j] {
                recursive(arr, row, col, n / 2) // 0 - 2, 0 - 2
                recursive(arr, row, col + n / 2, n / 2) // 0 - 2, 2 - 4
                recursive(arr, row + n / 2, col, n / 2) // 2 - 4, 0 - 2
                recursive(arr, row + n / 2, col + n / 2, n / 2) // 2 - 4, 2 - 4
                return
            }
        }
    }
    if num == 1 { 
        one += 1
    } else {
        zero += 1    
    }
}

func solution(_ arr:[[Int]]) -> [Int] {
    var n = arr.first!.count
    recursive(arr, 0, 0, n)
    return [zero, one]
}