import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordsArray: [String] = []
    
    if words[0].count < 2 {
        return [1, 1]
    }
    wordsArray.append(words[0])
    
    for i in 1..<words.count {
        if words[i].first! == wordsArray[i - 1].last! && !wordsArray.contains(words[i]) && words[i].count > 1 {
            wordsArray.append(words[i])
        } else {
            let num = (i + 1) % n == 0 ? n : (i + 1) % n 
            let sequence = wordsArray.count / n + 1
            return [num, sequence]
        }
    }
    
    return [0, 0]
}
