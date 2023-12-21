import Foundation

let n = Int(readLine()!)
var max = 1

while true {
    if (max * (max + 1)) / 2 > n! {
        max -= 1
        break
    }
    max += 1
}
print(max)