let n = Int(readLine()!)!
let result = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
var repeatCount = 1
var count = 8 * repeatCount
var routine = count / 4
var routineCount = 1
var x = n / 2, y = n / 2
var position = 0
arr[x][y] = 1

for i in 1..<n * n {
    switch routineCount {
    case 1:
        if i == position + 1 {
            x -= 1
        } else {
            y += 1
        }
    case 2:
        x += 1
    case 3:
        y -= 1
    case 4:
        x -= 1
    default:
        break
    }
    arr[x][y] = i + 1
    if i == (routine * routineCount) + position  {
        routineCount += 1
    }
    if i == count {
        position += 8 * repeatCount
        repeatCount += 1
        count += 8 * repeatCount
        routine = 8 * repeatCount / 4
        routineCount = 1
    }
}

var resultX = 0
var resultY = 0

for i in 0..<n {
    for j in 0..<n {
        if arr[i][j] == result {
            resultX = i + 1
            resultY = j + 1
        }
        print(arr[i][j], terminator: " ")
    }
    print("")
}
print("\(resultX) \(resultY)")