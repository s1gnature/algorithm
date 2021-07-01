import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let gcd = getGcd(w: w, h: h)
    return (Int64(w * h) - (Int64(w/gcd + h/gcd - 1) * Int64(gcd)))
}

func getGcd(w: Int, h: Int) -> Int {
    let bigNum = max(w, h)
    let smallNum = min(w, h)
    if bigNum % smallNum == 0 { return smallNum }
    for minusValue in 0..<smallNum/2 {
        let divideNum = smallNum/2 - minusValue
        if bigNum % divideNum == 0 && smallNum % divideNum == 0 { return divideNum }
    }
    return 1
}
print(solution(8, 12))