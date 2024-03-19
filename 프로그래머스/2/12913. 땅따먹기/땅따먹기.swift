import Foundation

func solution(_ land:[[Int]]) -> Int{
   var answer = 0
    var land = land
    for i in 0..<(land.count-1) {
        land[i+1][0] += max(land[i][1], land[i][2], land[i][3])
        land[i+1][1] += max(land[i][0], land[i][2], land[i][3])
        land[i+1][2] += max(land[i][0], land[i][1], land[i][3])
        land[i+1][3] += max(land[i][0], land[i][1], land[i][2])
    }
 
    guard let last = land.last else { return 0 }
    return max(last[0],last[1], last[2], last[3])
}
//  var lands = land
//     var result = lands[0].max()!
//     var removeIndex = lands[0].firstIndex(of: result)!

//     for i in 1..<lands.count {
//         // 현재가 최대였다가 그게 삭제된다면 다음 인덱스를 출력해야 함
//         var currentMax = lands[i].max()!
//         var currentMaxIndex = lands[i].firstIndex(of: currentMax)!
//         if currentMaxIndex == removeIndex {
//             let currentLand = lands[i]
//             lands[i].remove(at: removeIndex)
//             currentMax = lands[i].max()!
//             result += currentMax
//             removeIndex = currentLand.firstIndex(of: currentMax)!
//         } else {
//             result += currentMax
//             removeIndex = currentMaxIndex    
//         }
//     }

//     return result