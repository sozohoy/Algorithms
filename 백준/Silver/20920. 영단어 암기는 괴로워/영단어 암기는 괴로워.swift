let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var words: [String] = []
var dicts: [String: Int] = [:]

for _ in 0..<n {
    let word = readLine()!
    if word.count >= m {
        words.append(word)
    }
}

for i in 0..<words.count {
    if dicts[words[i]] == nil {
        dicts[words[i]] = 1
    } else {
        dicts[words[i]]! += 1
    }
}

print(dicts.sorted { pre, next in
    if pre.value == next.value {
        if pre.key.count == next.key.count {
            return pre.key < next.key
        } else {
            return pre.key.count > next.key.count
        }
    } else {
        return pre.value > next.value
    }
}.map { $0.key }.joined(separator: "\n"))