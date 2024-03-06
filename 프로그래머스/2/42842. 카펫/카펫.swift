import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = []
    var repeatedArray: [Int] = []

    for i in 1...yellow {
        if yellow % i == 0 {
            repeatedArray.append(i)
        }
    }

    for i in 0..<repeatedArray.count {
        let recordYellow = yellow / repeatedArray[i]
        var correctBrown = (recordYellow * 2) + (repeatedArray[i] * 2) + 4
        if correctBrown == brown {
            result.append(recordYellow + 2)
            result.append(repeatedArray[i] + 2)
            break
        }
    }
    
    return result
}