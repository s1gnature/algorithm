import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var res = [Int]()
    let defaultTime = fees[0]
    let defaultFee = fees[1]
    let unitTime = fees[2]
    let unitFee = fees[3]
    
    var inOutDic = Dictionary<String, Int>()
    var timeStackDic = Dictionary<String, Int>()
    
    for record in records {
        let cmd = record.split(separator: " ")
        let time = convertTimeToMinute(String(cmd[0]))
        let number = String(cmd[1])
        let state = cmd[2]
        
        if state == "IN" {
            if timeStackDic[number] == nil { timeStackDic[number] = 0 }
            inOutDic[number] = time
        } else {
            timeStackDic[number] = timeStackDic[number]! + time - inOutDic[number]!
            inOutDic[number] = nil
        }
    }
    
    return timeStackDic.sorted(by: {$0.key < $1.key }).map({
        if inOutDic[$0.key] != nil {
            let time = timeStackDic[$0.key]! + convertTimeToMinute("23:59") - inOutDic[$0.key]!
            return calcFee(time: time, dt: defaultTime, df: defaultFee, ut: unitTime, uf: unitFee)
        } else {
            return calcFee(time: $0.value, dt: defaultTime, df: defaultFee, ut: unitTime, uf: unitFee)
        }
    })
}

func convertTimeToMinute(_ time: String) -> Int {
    let time = time.split(separator: ":").map{ Int($0)! }
    
    return time[0] * 60 + time[1]
}

func calcFee(time: Int, dt: Int, df: Int, ut: Int, uf: Int) -> Int {
    if time <= dt { return df }
    return df + Int(ceil(Double(time - dt) / Double(ut))) * uf
}