// [11054번] 가장 긴 바이토닉 부분 수열
let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int($0)! }
var ascend_dp = Array(repeating: 0, count: n)
var decend_dp = Array(repeating: 0, count: n)
var res = 0

(0..<n).forEach {
    let value = input[$0]
    var cnt = 0
    (0..<$0).forEach {
        if value > input[$0] { cnt = max(cnt, ascend_dp[$0]) }
    }
    ascend_dp[$0] = cnt + 1
}
(0..<n).reversed().forEach {
    let value = input[$0]
    var cnt = 0
    ($0+1..<n).reversed().forEach {
        if value > input[$0] { cnt = max(cnt, decend_dp[$0]) }
    }
    decend_dp[$0] = cnt + 1
}
(0..<n).forEach {
    res = max(res, ascend_dp[$0] + decend_dp[$0] - 1)
}
print(res)