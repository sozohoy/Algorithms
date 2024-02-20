let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let elements = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var result = 0

func makeResult(_ num: Int) {
    if num > n {
        return
    }
    if num > result {
        result = num
    }
    for i in 0..<elements.count {
        makeResult(num * 10 + elements[i])
    }
}

for i in 0..<elements.count {
    makeResult(elements[i])
}
print(result)