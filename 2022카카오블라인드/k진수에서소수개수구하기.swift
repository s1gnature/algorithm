import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var dp = Dictionary<Int, Bool>()
    let bits = String(n, radix: k).split(separator: "0")
    var res = 0
    for num in bits {
        if isPrime(Int(num)!, dp: &dp) { res += 1 }
    }
    return res
}

func isPrime(_ n: Int, dp: inout Dictionary<Int, Bool>) -> Bool {
    if n == 1 { return false }
    else if let res = dp[n] { return res }

    for factor in stride(from: 2, to: Int(sqrt(Double(n))+1), by: 1) {
        if n % factor == 0 {
            dp[n] = false
            return false
        }
    }
    
    dp[n] = true
    return true
}