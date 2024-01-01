var input = Int(readLine()!)!
var count = 0

if input == 1 || input == 3 {
    count = -1
} else if input % 5 % 2 == 0  {
    count = input / 5
    count += input % 5 / 2
} else {
    count = (input / 5) - 1
    input -= 5 * count
    count += input / 2
}
print(count)