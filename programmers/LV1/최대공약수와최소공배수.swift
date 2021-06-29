import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    var minValue = min(n, m)
    var maxValue = max(n, m)
    var minPrimeMax = 1
    for num in 0..<minValue {
        if minValue % (minValue - num) == 0 && maxValue % (minValue - num) == 0 {
            minPrimeMax = minValue - num
            break
        }
    }
    return [minPrimeMax, minPrimeMax * (m / minPrimeMax) * (n / minPrimeMax)]
}