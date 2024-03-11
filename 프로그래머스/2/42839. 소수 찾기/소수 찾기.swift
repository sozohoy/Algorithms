import Foundation

func solution(_ numbers:String) -> Int {
    var numbersToArray = numbers.map { String($0) }.sorted { $0 > $1 }
    var possibleNumbers: Set<Int> = []
    var result: Int = 0

    for pickCount in 1...numbersToArray.count {
        permutations(numbersToArray, pickCount).forEach {
            let number = Int($0)!
            possibleNumbers.insert(number)
        }
    }

    for item in possibleNumbers {
        if isPrime(item) {
            result += 1
        }
    }
    return result
}

func permutations(_ elements: [String], _ k: Int) -> [String] {
    guard k > 0 else { return [] }
    guard k <= elements.count else { return [] }

    if k == 1 {
        return elements
    }

    var result = Set<String>()

    for i in 0..<elements.count {
        var reducedElements = elements
        reducedElements.remove(at: i)
        let permut = permutations(reducedElements, k - 1)
        for j in 0..<permut.count {
            result.insert(elements[i] + permut[j])
        }
    }

    return result.map { String($0) }
}

func isPrime(_ n: Int) -> Bool {
    if n < 2 {
        return false
    }

    for i in 2..<Int(sqrt(Double(n)) + 1) {
        if n % i == 0 {
            return false
        }
    }

    return true
}