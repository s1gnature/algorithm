import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    let a = A.sorted()
    let b = Array(B.sorted().reversed())
    for idx in 0..<a.count {
        ans += a[idx] * b[idx]
    }
    return ans
}