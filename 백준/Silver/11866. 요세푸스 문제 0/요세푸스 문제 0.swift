import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var arr: [Int] = [Int](1...input[0])
var result: [Int] = []

while !arr.isEmpty {
  for i in 0..<input[1] - 1 {
    arr.append(arr.removeFirst())
  }
  result.append(arr.removeFirst())
}

print("<\(result.map { String($0) }.joined(separator: ", "))>")