import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let defaultMinutes = fees[0]
    let defaultCost = fees[1]
    let standardMinutes = fees[2]
    let standardCost = fees[3]
    // 차번호, 금액
    var calculateCost: [String: Int] = [:]
    var result: [Int] = []
    
    
    // 시간, 차번호, 출차여부 주어짐
    
    // 차번호 : (시각, 출차여부)
    var vehiclesInformation: [String: [(String, String)]] = [:]
    for record in records {
        let divideRecord = record.split(separator: " ").map { String($0) }
        if vehiclesInformation[divideRecord[1]] == nil {
            vehiclesInformation[divideRecord[1]] = [(divideRecord[0], divideRecord[2])]
        } else {
            vehiclesInformation[divideRecord[1]]!.append((divideRecord[0], divideRecord[2])) 
        }
    }
    
    for (key, info) in vehiclesInformation {
        var totalTime = 0
        var startTime = 0
        var totalCost = defaultCost
        var isEnteredVehicle = false
        for i in 0..<info.count { // 내역 갯수만큼 반복
            var timeAndMinute = info[i].0.split(separator: ":").map { Int($0)! }
            var time = 60 * timeAndMinute[0] + timeAndMinute[1] // 334
            if info[i].1 == "IN" {
                startTime = time
                isEnteredVehicle = true
            } else {
                totalTime += time - startTime
                startTime = 0
                isEnteredVehicle = false
            }
        }
        
        if isEnteredVehicle {
            totalTime += 1439 - startTime
        }
        totalTime -= defaultMinutes // 334 - 180

        if totalTime > 0 {
            if totalTime % standardMinutes != 0 {
                totalCost += ((totalTime / standardMinutes) + 1) * standardCost
            } else {
                totalCost += totalTime / standardMinutes * standardCost
            }
        }
        
        if calculateCost[key] == nil {
            calculateCost[key] = totalCost
        } else {
            calculateCost[key]! += totalCost
        }
    }
    
    result = calculateCost.sorted { Int($0.key)! < Int($1.key)! }.map { $0.value }
    return result
}