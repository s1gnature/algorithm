// [11722번] 가장 긴 감소하는 부분 수열
let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = Array(repeating: 0, count: n)

input.reversed().enumerated()
    .forEach { value in
        var len = 0
        (n - 1 - value.offset..<n).reversed().forEach { idx in
            if value.element > input[idx] { len = max(len, dp[idx]) }
        }
        dp[n - 1 - value.offset] = len + 1
    }
print(dp.max()!)