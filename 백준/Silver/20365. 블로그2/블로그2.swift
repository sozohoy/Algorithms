var _ = readLine()
var input = readLine()!
var count = input.last! == "R" || input.first! == "R" ? 1 : 0
print(input.split(separator: "R").count + count)