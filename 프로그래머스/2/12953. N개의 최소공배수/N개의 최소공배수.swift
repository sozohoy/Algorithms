func solution(_ arr:[Int]) -> Int {
    var result = arr.max()! - 1
    var findResult = false
    while !findResult {        
        result += 1
        for i in 0..<arr.count {
            if result % arr[i] != 0 {
                break
            }
            if i == arr.count - 1 && result % arr[i] == 0 {
                findResult = true
            }
        }
    }
    return result
}