struct Queue {
    var data = [Int]()
    var index = 0
    
    var count: Int {
        return data.count - index
    }
    
    mutating func push(_ n: Int) {
        data.append(n)
    }
    
    mutating func pop() -> Int {
        defer {
            index += 1
        }
        return data[index]
    }
}
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], K = input[1]
var queue = Queue()
(1...N).forEach { i in
    queue.push(i)
}
var result = [Int]()
while queue.count != 0 {
    for _ in 0..<(K - 1) {
        queue.push(queue.pop())
    }
    result.append(queue.pop())
}
print("<" + result.map { String($0) }.joined(separator: ", ") + ">")