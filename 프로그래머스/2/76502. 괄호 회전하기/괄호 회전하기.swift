import Foundation

func solution(_ s:String) -> Int {
    var bracketStack: [String] = []
    var currentString = s
    var maxCount = s.count / 2
    var count = 0

    for _ in 0..<s.count {
        var itemCount = 0
        for item in currentString {
            if item == ")" {
                if bracketStack.count > 1 {
                    if bracketStack.last! == "(" {
                        bracketStack.removeLast()
                    } else {
                        break
                    }
                } else if bracketStack.count == 1 {
                    if bracketStack.last! == "(" {
                        bracketStack.removeLast()
                        itemCount += 1
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
            else if item == "]" {
                if bracketStack.count > 1 {
                    if bracketStack.last! == "[" {
                        bracketStack.removeLast()
                    } else {
                        break
                    }
                } else if bracketStack.count == 1 {
                    if bracketStack.last! == "[" {
                        bracketStack.removeLast()
                        itemCount += 1
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
            else if item == "}" {
                if bracketStack.count > 1 {
                    if bracketStack.last! == "{" {
                        bracketStack.removeLast()
                    } else {
                        break
                    }
                } else if bracketStack.count == 1 {
                    if bracketStack.last! == "{" {
                        bracketStack.removeLast()
                        itemCount += 1
                    } else {
                        break
                    }
                } else {
                    break
                }
            } else {
                bracketStack.append(String(item))
            }
        }
        count = max(itemCount, count)
        print(maxCount)
        if count == maxCount {
            break
        } else {
            let first = String(currentString.removeFirst())
            bracketStack = []
            currentString += first
        }
    }
    return bracketStack.isEmpty ? count : 0
}