let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = Array(repeating: Array(repeating: "", count: input[1]), count: input[0])
var resultDna = ""
var resultCount = 0

for i in 0..<input[0] {
    let str = readLine()!.compactMap { String($0) }
    for j in 0..<str.count {
        arr[i][j] = str[j]
    }
}

for i in 0..<input[1] {
    var str: [String: Int] = [:]
    for j in 0..<input[0] {
        if str[arr[j][i]] != nil {
            str[arr[j][i]]! += 1
        } else {
            str[arr[j][i]] = 1
        }

    }
    let sortedStr = str.sorted {
        if $0.value == $1.value {
            return $0.key < $1.key
        } else {
            return $0.value > $1.value
        }
    }
    for i in 1..<sortedStr.count {
        resultCount += sortedStr[i].value
    }
    resultDna += sortedStr[0].key
}

print(resultDna)
print(resultCount)