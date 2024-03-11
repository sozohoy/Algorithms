import Foundation

func solution(_ numbers:[Int]) -> String {
    var arr = numbers.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")! }.map { String ($0) }
    return arr[0] == "0" ? "0" : arr.reduce("", +)
}