import Foundation

var tc_a1 = [1,2,3,4]
var tc_b1 = [-3,-1,0,2]
var tc_a2 = [-1,0,1]
var tc_b2 = [1,0,-1]

func solution(a: [Int], b: [Int]) -> Int {
    var result = 0
    for idx in 0..<a.count {
        result += a[idx] * b[idx]
    }
    return result
}

print(solution(a: tc_a1, b: tc_b1))