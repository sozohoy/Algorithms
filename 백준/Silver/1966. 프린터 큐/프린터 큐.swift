let repeatCount = Int(readLine()!)!

for _ in 0..<repeatCount {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let inputArray = readLine()!.split(separator: " ").map { Int($0)! }
  var queue: [(Int, Int)] = []
  var result: [(Int, Int)] = []
  for i in 0..<input[0] {
    queue.append((i, inputArray[i]))
  }
  
  while !queue.isEmpty {
    let max = queue.max { first, second in
      return first.1 < second.1
    }
    let item = queue.removeFirst()
    if item.1 == max!.1 {
      result.append(item)
    } else {
      queue.append(item)
    }
  }
  let index = result.firstIndex { $0.0 == input[1] }.map { Int(exactly: $0)! }!
  print(index + 1)
}