// [12865번] 평범한 배낭
import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var input = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: nk[1]+1), count: nk[0]+1)
var res = 0
(0..<nk[0]).forEach { _ in input.append(readLine()!.split(separator: " ").map { Int(String($0))! }) }

input.enumerated().forEach { (idx, wv) in
    let idx = idx + 1
    let w = wv[0]
    let v = wv[1]
    dp[idx].enumerated().forEach { (sumOfW, value) in
        dp[idx][sumOfW] = dp[idx-1][sumOfW]
        if w > sumOfW {
            return
        } else {
            dp[idx][sumOfW] = max(v + dp[idx-1][sumOfW-w], dp[idx-1][sumOfW])
        }
        res = max(res, dp[idx][sumOfW])
    }
}
dp.forEach { print($0) }
print(res)