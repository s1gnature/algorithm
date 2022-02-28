// [1463번] 1로 만들기
let x = Int(readLine()!)!
if x == 1 { print(0) }
else {
    var dp = Array(repeating: 0, count: x + 1)
    (2...x).forEach {
        dp[$0] = dp[$0-1]+1
        if $0 % 3 == 0 { dp[$0] = min(dp[$0/3]+1, dp[$0]) }
        if $0 % 2 == 0 { dp[$0] = min(dp[$0/2]+1, dp[$0]) }
    }
    print(dp[x])
}