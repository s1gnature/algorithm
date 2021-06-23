import Foundation

let tc1_d = [1,3,2,5,4]
let tc1_budget = 9
// result = 3
let tc2_d = [2,2,3,3]
let tc2_budget = 10
// result = 4

func solution(_ d:[Int], _ budget:Int) -> Int {
    var resultCnt = 0
    var budget = budget
    var d = d.sorted()
    
    for part in d {
        budget -= part
        if budget < 0 { break }
        else { resultCnt += 1}
    }
    return resultCnt
}

print(solution(tc2_d, tc2_budget))
