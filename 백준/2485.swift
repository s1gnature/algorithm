// [2485번] 가로수
import Foundation

let n = Int(readLine()!)!
var input = [Int]()
var gaps = [Int]()
(0..<n).forEach { _ in
    let newValue = Int(readLine()!)!
    if input.count != 0 {
        gaps.append(newValue-input.last!)
    }
    input.append(newValue)
}
func gcd(_ a: Int, _ b: Int) -> Int {
    var (a, b) = (a, b)
    while true {
        let r = a%b
        if r == 0 { return b }
        a = b
        b = r
    }
}
func gcdOfList() -> Int {
    var res = gaps.popLast()!
    gaps.forEach {
        res = gcd(max(res, $0), min(res, $0))
    }
    return res
}
print(((input.last!-input.first!)/gcdOfList()) - input.count + 1)