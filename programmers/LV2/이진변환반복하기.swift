import Foundation

// result tc1 = [3,8]
let tc1_s = "110010101001"

func solution(_ s:String) -> [Int] {
    var s = s
    var cntZero = 0
    var cntCast = 0
    while s != "1" {
        var len = s.filter{ $0 == "1" }.count
        cntZero += (s.count - len)
        cntCast += 1
        s = String(len, radix: 2)
    }
    return [cntCast, cntZero]
}

print(solution(tc1_s))