import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    func dfs(index: Int, result: Int) -> Int {
        if index == numbers.count - 1 && result == target {
            return 1
        }

        guard index + 1 < numbers.count else { return 0 }

        let positive = dfs(index: index + 1, result: result + numbers[index + 1])
        let negative = dfs(index: index + 1, result: result - numbers[index + 1])

        return positive + negative
    }
    
    let result = dfs(index: -1, result: 0)
    return result
}