import Foundation
func isPrime(num: Int) -> Bool {
    if num == 2 || num == 3 { return true }
    for divideNum in 2...Int(sqrt(Double(num))){
       if num % divideNum == 0 { return false }
    }
    return true
}

func solution(_ n:Int) -> Int {
    var resultSum = 0
    for num in 2...n {
        if isPrime(num: num) { resultSum += 1}
    }
    return resultSum
}

print(solution(10))