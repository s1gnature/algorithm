import Foundation

func solution(_ n:Int) -> Int {
    var res = 0
    var n = n
    while n != 0 {
        if n % 2 == 1 {
            res += 1
            n -= 1
        }
        n /= 2
    }
    return res
}