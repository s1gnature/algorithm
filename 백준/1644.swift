// [1644번] 소수의 연속합
import Foundation

let n = Int(readLine()!)!
var primeChecker = Array(repeating: true, count: n+1)
var res = 0
func searchPrimes() {
    primeChecker[0] = false
    primeChecker[1] = false
    for pivot in (2..<n+1) {
        if !primeChecker[pivot] { continue }
        for remover in stride(from: pivot*2, to: n+1, by: pivot) {
            primeChecker[remover] = false
        }
    }
}
func dfs(_ currIdx: Int, _ sum: Int) {
    if sum >= n {
        if sum == n { res += 1 }
        return
    }
    if currIdx >= primes.count {
        return
    }
    dfs(currIdx+1, sum+primes[currIdx].offset)
}
searchPrimes()
var primes = primeChecker.enumerated().filter{ $0.element == true }
(0..<primes.count).forEach {
    dfs($0, 0)
}
print(res)