func solution() {

    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let a = input[0]
    var b = input[1]
    var count = 1

    while a < b {
        if b % 2 == 0 {
            b /= 2
        } else if b % 10 != 1 {
            break
        } else {
            b /= 10
        }
        count += 1
    }
    a == b ? print(count) : print("-1")
    
}
solution()