// [2579번] 계단 오르기
let n = Int(readLine()!)!
var input = [Int]()
var dp = Array(repeating: 0, count: n)
(0..<n).forEach{ _ in input.append(Int(readLine()!)!) }

func solution() {
    dp[0] = input[0]
    dp[1] = input[0] + input[1]
    dp[2] = max(input[0] + input[2], input[1] + input[2])
    (3..<n).forEach { dp[$0] = max(dp[$0-2], dp[$0-3] + input[$0-1]) + input[$0] }
    print(dp.last!)
}

if input.count == 1 { print("\(input.first!)") }
else if input.count == 2 { print("\(input[0] + input[1])") }
else { solution() }