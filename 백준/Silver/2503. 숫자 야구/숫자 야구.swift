import Foundation

var question: [[Int]] = []

let n = Int(readLine()!)!

for _ in 0..<n {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    question.append(s)
}

var result = 0

for i in 123..<988 {
    let hundreds = i / 100
    let tens = (i / 10) % 10
    let units = i % 10

    if hundreds == tens || hundreds == units || tens == units {
        continue
    }

    if tens == 0 || units == 0 {
        continue
    }

    var flag = true

    for integers in question {
        let answer = integers[0]
        let hundredsOfAnswer = answer / 100
        let tensOfAnswer = (answer / 10) % 10
        let unitsOfAnswer = answer % 10

        let strikeAnswer = integers[1]
        let ballAnswer = integers[2]

        var strikeCount = 0
        var ballCount = 0

        if hundreds == hundredsOfAnswer {
            strikeCount += 1
        }

        if tens == tensOfAnswer {
            strikeCount += 1
        }

        if units == unitsOfAnswer {
            strikeCount += 1
        }

        if hundredsOfAnswer == tens || hundredsOfAnswer == units {
            ballCount += 1
        }

        if tensOfAnswer == hundreds || tensOfAnswer == units {
            ballCount += 1
        }

        if unitsOfAnswer == tens || unitsOfAnswer == hundreds {
            ballCount += 1
        }

        if ballCount != ballAnswer || strikeCount != strikeAnswer {
            flag = false
            break
        }
    }

    if flag {
        result += 1
    }
}

print(result)