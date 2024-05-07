import Foundation

let input = Int(readLine()!)!
var arr: [[Int]] = []
var white = 0
var blue = 0

for _ in 0..<input {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(line)
}

func reculsive(row: Int, col: Int, size: Int) {
    if checkVaild(row: row, col: col, size: size) {
        if arr[row][col] == 0 {
            white += 1
        } else {
            blue += 1
        }
        return
    }

    let nextSize = size / 2

    reculsive(row: row, col: col, size: nextSize)
    reculsive(row: row, col: col + nextSize, size: nextSize)
    reculsive(row: row + nextSize, col: col, size: nextSize)
    reculsive(row: row + nextSize, col: col + nextSize, size: nextSize)
}

func checkVaild(row: Int, col: Int, size: Int) -> Bool {
    let checkColor = arr[row][col]
    for i in row..<row + size {
        for j in col..<col + size {
            if arr[i][j] != checkColor {
                return false
            }
        }
    }
    return true
}

reculsive(row: 0, col: 0, size: input)
print(white)
print(blue)