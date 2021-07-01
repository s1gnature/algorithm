import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let gcd = getGcd(w, h)
    return (Int64(w * h) - (Int64(w/gcd + h/gcd - 1) * Int64(gcd)))
}

func getGcd(_ a: Int, _ b: Int) -> Int {
    if a == 0 { return b }
    return getGcd(b%a, a)
}
print(solution(12, 8))

print(8 % 12)