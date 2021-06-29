import Foundation

func solution(_ n:Int) -> Int {
    if n == 0 { return 0 }
    var resultSum = 0
    var sqrtValue = Int(sqrt(Double(n)))
    for divideNum in 1...sqrtValue {
        if n % divideNum == 0 {
          resultSum += divideNum
          resultSum += n / divideNum
        }
    }
    if sqrtValue * sqrtValue == n { resultSum -= sqrtValue }
    return resultSum
}

print(solution(n))