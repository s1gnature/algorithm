// [2293번] 동전 1
import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
var coin = [Int]()
var dp = Array(repeating: 0, count: nk[1]+1)
(0..<nk[0]).forEach { _ in
    let c = Int(readLine()!)!
    if c <= nk[1] { coin.append(c) }
}
dp[0] = 1
coin.forEach { coin in
    (1...nk[1]).forEach { value in
        if (value-coin >= 0) {
            if dp[value]+dp[value-coin] >= Int(pow(2.0, 31.0)) { dp[value] = 0 }
            else { dp[value] += dp[value-coin] }
        }
    }
}

print(dp[nk[1]])