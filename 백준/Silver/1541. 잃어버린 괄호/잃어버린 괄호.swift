import Foundation

let array = ["-", "+"]
var input = readLine()!
var operators: [String] = []

for i in input {
    if i.description == array[0] {
        operators.append(array[0])
    } else if i.description == array[1] {
        operators.append(array[1])
    }
}

input = input.replacingOccurrences(of: "-", with: " ")
input = input.replacingOccurrences(of: "+", with: " ")
var nums = input.split(separator: " ").map { Int(String($0))! }

var accumulate = nums[0]
var result = 0
var isMinus = false

for i in 0..<operators.count{
    if operators[i] == "+" { // + 일때
        accumulate += nums[i + 1]
    } else { // - 일때
        if accumulate > 0 && isMinus == false {
            result += accumulate
            accumulate = nums[i + 1]
            isMinus = true
        } else {
            accumulate += nums[i + 1]
            result -= accumulate
            accumulate = 0
        }
    }
}

if isMinus {
    print(result - accumulate)
} else {
    print(accumulate)
}