import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    // genres : ["classic", "pop", "classic", "classic", "pop"]
    // plays : [500, 600, 150, 800, 2500]
    // [i: (genres, plays)]
    var result: [Int] = []
    var dic: [Int: (String, Int)] = [:]
    var genreDic: [String: (Int, Int)] = [:] // 장르 2개, 재생횟수 N개
    for i in 0..<genres.count {
        dic[i] = (genres[i], plays[i])
        if genreDic[genres[i]] == nil {
            genreDic[genres[i]] = (2, plays[i])
        } else {
            genreDic[genres[i]]!.1 += plays[i]
        }
    }
    var genreArr: [(String, Int)] = genreDic.sorted { $0.value.1 > $1.value.1 }.map { ($0.key, 2) }

    var resultArr = dic.sorted { pre, next in
        if pre.value.1 != next.value.1 { // 재생횟수 다를 경우
            return pre.value.1 > next.value.1
        } else { // 재생횟수 같으면 고유번호 낮은 순서
            return pre.key < next.key
        }
    }.map { ($0.key, $0.value.0) } 
    for i in 0..<genreArr.count {
        for j in 0..<resultArr.count {
            if genreArr[i].0 == resultArr[j].1 {
                genreArr[i].1 -= 1
                result.append(resultArr[j].0)
            }
            if genreArr[i].1 == 0 {
                break
            }
        }
    }
    // print(genreArr)
    // print(resultArr)
    // print(result)
    return result
}