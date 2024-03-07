import Foundation

let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
let aaa = ["A", "A", "A"]
func solution(_ name: String) -> Int {
    var names = name.map { String($0) }
    var horizental: Int = names.count - 1
    var vertical: Int = 0
    var frontIndex = 0
    var behindIndex = 26
    for i in 0..<names.count {
        var num = i + 1 
        while num < names.count && names[num] == "A" {
            num += 1
        }
        let rightIndex = i * 2 + names.count - num
        let leftIndex = (names.count - num) * 2 + i
        horizental = min(horizental, leftIndex)
        horizental = min(horizental, rightIndex)
        let frontIndex = alphabet.firstIndex(of: String(names[i]))!
        let behindIndex = behindIndex - frontIndex
        if frontIndex < behindIndex {
            vertical += frontIndex
        } else  {
            vertical += behindIndex
        } 
    }
    return vertical + horizental
}

