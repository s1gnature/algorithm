// [1904번] 01타일
let n = Int(readLine()!)!
var dp = [1, 2]
if n == 1 { print(1) }
else if n == 2 { print(2) }
else {
    (2..<n).forEach { dp.append((dp[$0-2] + dp[$0-1]) % 15746) }
    print(dp.last!)
}