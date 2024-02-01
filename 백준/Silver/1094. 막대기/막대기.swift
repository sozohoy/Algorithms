let str = String(Int(readLine()!)!, radix: 2)
print(str.filter{ $0 == "1" }.count)
