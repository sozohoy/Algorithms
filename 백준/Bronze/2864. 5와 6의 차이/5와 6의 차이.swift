import Foundation

let n = readLine()!.split(separator: " ")

for i in 0...1 {
    let first = Int(n[0].replacingOccurrences(of: "\(6 - i)", with: "\(5 + i)"))!
    let last = Int(n[1].replacingOccurrences(of: "\(6 - i)", with: "\(5 + i)"))!
    print("\(first + last)", terminator: " ")
}