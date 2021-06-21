import Foundation

let tc1_left = 13
let tc1_right = 17
// result = 43
let tc2_left = 24
let tc2_right = 27
/*
func solution(_ left:Int, _ right:Int) -> Int {
    var resultSum = 0
    for value in left...right {
        var sqrtValue = Int(sqrt(Double(value)))
        if sqrtValue * sqrtValue == value { resultSum -= value }
        else { resultSum += value }
    }
    return resultSum
}
*/
func solution(_ left:Int, _ right:Int) -> Int {
    var sum = (right*(right+1))/2 - (left*(left-1))/2
    
    var sqrtValue = 1
    while sqrtValue * sqrtValue <= right {
        if sqrtValue * sqrtValue >= left { sum -= (sqrtValue * sqrtValue) * 2}
        sqrtValue += 1
    }
    return sum
}
print(solution(tc1_left, tc1_right))
