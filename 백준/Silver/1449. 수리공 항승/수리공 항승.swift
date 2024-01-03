let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var n = input[0], length = input[1] // length - 1 == 거리 일 경우 붙힐 수 이씀
var position = readLine()!.split(separator: " ").map { Double(String($0))! }.sorted()

var result = 1
var start = position[0]
var end = start + Double(length) - 0.5

for i in 0..<position.count {
    if end >= position[i] {
        continue
    } else {
        result += 1
        end = position[i] + Double(length) - 0.5
    }
}

print(result)