import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var position = Array(0...100000)
var isVisited: [Bool] = Array(repeating: false, count: 100001)
var result = input[1] - input[0]
var queue: [[(Int, Int)]] = []
var count = 0

func bfs(n: Int) {
    isVisited[n] = true
    queue.append([(n, 0)])
    while !queue.isEmpty {
        var element = queue.removeFirst()
        count += 1
        var items: [(Int, Int)] = []
        for i in 0..<element.count {
            if element[i].0 * 2 <= 100000 && !isVisited[element[i].0 * 2] {  // 인덱스 범위 체크 추가
                items.append((element[i].0 * 2, element[i].1 - 1))
                isVisited[element[i].0 * 2] = true
            }
            if element[i].0 - 1 >= 0 && !isVisited[element[i].0 - 1] {  // 인덱스 범위 체크 추가
                items.append((element[i].0 - 1, element[i].1))
                isVisited[element[i].0 - 1] = true
            }
            if element[i].0 + 1 <= 100000 && !isVisited[element[i].0 + 1] {  // 인덱스 범위 체크 추가
                items.append((element[i].0 + 1, element[i].1))
                isVisited[element[i].0 + 1] = true
            }
            if element[i].0 == input[1] {
                count += element[i].1
                return
            }
        }
        queue.append(items)
    }
}
bfs(n: input[0])
print(count - 1)