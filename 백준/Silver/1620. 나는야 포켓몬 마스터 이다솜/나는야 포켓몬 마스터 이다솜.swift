let input = readLine()!.split(separator:" ").map{Int($0)!}
let (n, m) = (input[0], input[1])
var dic: [String: Int] = [:]
var dicWithInt: [Int: String] = [:]

for i in 1...n {
    let pokemon = readLine()!
    dic[pokemon] = i
    dicWithInt[i] = pokemon
}

for _ in 1...m {
    let question = readLine()!
    if Int(question) != nil {
        print(dicWithInt[Int(question)!]!)
    } else {
        print(dic[question]!)
    }
}