import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let arr = times.sorted()
    var start = arr.first!
    var end = arr.last! * n
    var answer = end
    while start <= end {
        let mid = (start + end) / 2
        var total = 0
        for i in 0..<arr.count {
            total += mid / arr[i]
        }
        
        if total < n {
            start = mid + 1
        } else {
            end = mid - 1
            answer = min(answer, mid)
        }
    }
    return Int64(answer)
}