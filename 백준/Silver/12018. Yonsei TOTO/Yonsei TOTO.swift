import Foundation

let input = readLine()?.split(separator: " ").map { Int(String($0)) }

var n = input![0]! // 과목 수
var m = input![1]! // 마일리지

var minimumMileage: [Int] = []

for _ in 0..<n {
    let courseInput = readLine()?.split(separator: " ").map { Int(String($0)) }
    let registeredCount = courseInput![0]! // 수강신청한 인원
    let registeredNumber = courseInput![1]! - 1 // 과목을 들을 수 있는 인원
    let mileageArray = readLine()?.split(separator: " ").map { Int(String($0)) }.sorted(by: {$0! > $1!})
    if registeredCount > registeredNumber {
        minimumMileage.append(mileageArray![registeredNumber]!)
    } else {
        minimumMileage.append(1)
    }
}

minimumMileage.sort(by: {$0 < $1})
var result = 0

for i in 0..<n {
    if (m - minimumMileage[i]) >= 0 {
        m -= minimumMileage[i]
        result += 1
    } else {
        break
    }
}

print(result)