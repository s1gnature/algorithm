// [6588번] 골드바흐의 추측
import Foundation

let n = 1000000
var primeChecker = Array(repeating: true, count: n+1)
var res = [Int]()
func searchPrimes() {
    for pivot in (2..<n+1) {
        if !primeChecker[pivot] { continue }
        for remover in stride(from: pivot*2, to: n+1, by: pivot) {
            primeChecker[remover] = false
        }
    }
}
func goldbach(_ target: Int) -> String? {
    for num in stride(from: 3, to: target-2, by: +2) {
        if primeChecker[num] && primeChecker[target-num] {
            return "\(target) = \(num) + \(target-num)"
        }
    }
    return nil
}
searchPrimes()
while let target = Int(readLine()!) {
    if target == 0 { break }
    if let res = goldbach(target) {
        print(res)
    } else {
        print("Goldbach's conjecture is wrong.")
    }
}
