import Foundation

func solution(_ n:Int) -> Int {
    let nBitCount = n.nonzeroBitCount
    var res = n
    repeat {
        res += 1
    } while (nBitCount != res.nonzeroBitCount)
    return res
}