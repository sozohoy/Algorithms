import Foundation

let n = Int(readLine()!)!
var array: [Int] = []

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}
array.sort()

// 산술 평균
print(Int(round(array.map { Double($0) }.reduce(0, +) / Double(n))))

// 중앙 값
print(array[n / 2])

// 최빈 값
let dict = Dictionary(array.map { ($0, 1) }, uniquingKeysWith: +)
let maxValues = dict.filter { $0.value == dict.values.max()! }.sorted { $0.key < $1.key }
if maxValues.count == 1 {
    print(maxValues.first!.key)
} else {
    print(maxValues[1].key)
}

// 범위
print(array.last! - array.first!)