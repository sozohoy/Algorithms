import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var answer: Int = 0
    var minSorted = A.sorted(by: >)
    var maxSorted = B.sorted(by: <)
    
    for i in 0..<minSorted.count {
        answer += minSorted[i] * maxSorted[i]
    }

    return answer
}