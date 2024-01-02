var input = readLine()!
var number = input.map { String($0) }.first!
var array = [0, 0]
for i in input {
    if number.last == i {
        number += String(i)
    } else {
        array[1 - Int(String(i))!] += 1
        number = String(i)
    }
}
array[Int(String(number.first!))!] += 1
print(array.min()!)