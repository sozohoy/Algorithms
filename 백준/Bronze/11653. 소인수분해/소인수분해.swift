let input = Int(readLine()!)!

if input > 1 {
    var result = input
    var divider = 2
    while result > 1 {
        if result % divider == 0 {
            print(divider)
            result /= divider
            divider = 2
        } else {
            divider += 1
        }
    }
}