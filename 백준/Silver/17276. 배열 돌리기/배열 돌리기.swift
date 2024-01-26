let testCase = Int(readLine()!)!
let dx = [0, 0, 1, 1, 0, 0, -1, -1]
let dy = [1, 1, 0, 0, -1, -1, 0, 0]

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arr = Array(repeating: Array(repeating: 0, count: input[0]), count: input[0])
    let degree = input[1]
    var distance = 1
    for i in 0..<input[0] {
        let elements = readLine()!.split(separator: " ").map { Int(String($0))! }
        for j in 0..<input[0] {
            arr[i][j] = elements[j]
        }
    }
    var x = input[0] / 2
    var y = input[0] / 2
    let check = input[0] / 2
    if check >= 1 {
        for i in 1...check {
            var next = 0
            x -= 1
            y -= 1
            let repeatCount = input[1] > 0 ? degree / 45 : (360 + degree) / 45
            if repeatCount != 8 {
                for _ in 0..<repeatCount {
                    var current = arr[x][y]
                    for j in 0..<8 {
                        next = arr[x + dx[j] * distance][y + dy[j] * distance]
                        arr[x + dx[j] * distance][y + dy[j] * distance] = current
                        current = next
                        x += dx[j] * distance
                        y += dy[j] * distance
                    }
                }
            }
            distance = i + 1
        }
    }

    for i in 0..<input[0] {
        for j in 0..<input[0] {
            print(arr[i][j], terminator: " ")
        }
        print("")
    }
}