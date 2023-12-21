import Foundation

let n = Int(readLine()!)!

var nums: [Int] = []
for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}
nums.sort()

var count = nums.count
outerLoop: while true {
    if count == 2 {
        print(-1)
        break
    }
    for i in 0..<count - 2 {
        if nums[count - 1] < nums[count - i - 2] + nums[count - i - 3] {
            print(nums[count - 1] + nums[count - i - 2] + nums[count - i - 3])
            break outerLoop
        }
    }
    count -= 1
}