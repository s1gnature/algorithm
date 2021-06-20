import Foundation
let tc1_ab = [4,7,12]
let tc1_signs = [true,false,true]
let tc2_ab = [1,2,3]
let tc2_signs = [false,false,true]

func solution(absolutes: [Int], signs: [Bool]) -> Int {
    var result = 0
    absolutes.indices.forEach { indices in
        result += signs[indices] == true ? absolutes[indices] : -absolutes[indices]
    }
    return result
}

print(solution(absolutes: tc1_ab, signs: tc1_signs))