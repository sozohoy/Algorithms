import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesDictionary: [String: [String]] = [:]
    var result = 1
    for item in clothes {
        if clothesDictionary[item[1]] == nil {
            clothesDictionary[item[1]] = [item[0]]
        } else {
            clothesDictionary[item[1]]!.append(item[0])
        }
    }
    for (key, value) in clothesDictionary {
        result = result * (value.count + 1)
    }
    result -= 1
    return result
}