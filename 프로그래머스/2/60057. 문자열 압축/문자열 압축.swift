import Foundation

func solution(_ s:String) -> Int {
    var strings = s.map { String($0) }
    var result = s.count
    // 압축 횟수(1개, 2개, .., n개)
    for i in 0..<strings.count / 2 {
        // 문자 비교하여 갯수 증가
        var num = i + 1 // 몇글자 압축 해야하는지?
        var compression = 1 // 압축되는 카운트
        var compressionStringCount = 0
        for j in stride(from: 0, to: strings.count - num, by: num) {
            var frontStr = ""
            var backStr = ""
            let frontStart = j
            let frontEnd = j + num
            let backEnd = j + num + num
            if backEnd > strings.count {
                if compression > 1 {
                    compressionStringCount += num + String(compression).count
                } else {
                    compressionStringCount += num
                }
                compressionStringCount += num - (backEnd - strings.count)
                compression = 0
                break
            }
            for k in frontStart..<frontEnd {
                frontStr += strings[k]
            }
            for k in frontEnd..<backEnd {
                backStr += strings[k]
            }
            if frontStr == backStr {
                compression += 1
            } else {
                if compression > 1 {
                    compressionStringCount += num + String(compression).count
                    compression = 1
                } else {
                    compressionStringCount += num
                }
            }
        }
        if compression > 1 {
            compressionStringCount += num + String(compression).count
        } else if compression == 1 {
            compressionStringCount += num
        }
        result = min(result, compressionStringCount)
    }
    return result
}