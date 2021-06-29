import Foundation

let tc1 = [3, 0, 6, 1, 5] // result = 3
let tc2 = [4, 0, 6, 1, 5] // result = 3
let tc3 = [10, 11, 12, 13] // result = 4
func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    var hIndex = 0
    let citationLen = citations.count
    for idx in 0..<citationLen {
        if idx+1 == citations[idx] {
            return idx+1
        }else if idx+1 > citations[idx] {
            return idx
        }else {
            if hIndex < citations[idx] { hIndex = idx+1 }
            else {
                return hIndex
            }
        }
    }
    return hIndex
}

print(solution(tc1))

