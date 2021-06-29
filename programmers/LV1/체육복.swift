import Foundation

let tc1_n = 5
let tc1_lost = [2, 4]
let tc1_reserve = [1, 3, 5]
// reuslt = 5

let tc2_n = 5
let tc2_lost = [2, 4]
let tc2_reserve = [3]
// result = 4

let tc3_n = 3
let tc3_lost = [3]
let tc3_reserve = [1]
// return 2
let tc4_n = 5
let tc4_lost = [1,2,3]
let tc4_reserve = [2,3,4]
//return 4

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserve = reserve
    var lost = lost
    
    lost.forEach{
        if let idx = reserve.index(of: $0){
            lost.remove(at: lost.index(of: $0)!)
            reserve.remove(at: reserve.index(of: $0)!)
        }
    }

    var resultCnt = n - lost.count
    for lostNum in lost {
        if let idx = reserve.firstIndex(of: lostNum-1){
            reserve.remove(at: idx)
            resultCnt += 1
        }else if let idx = reserve.firstIndex(of: lostNum+1){
            reserve.remove(at: idx)
            resultCnt += 1
        }
    }
    return resultCnt
}

print(solution(tc4_n, tc4_lost, tc4_reserve))

