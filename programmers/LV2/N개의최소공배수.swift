func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { getLCM($0, $1) }
}

func getLCM(_ a: Int, _ b: Int) -> Int {
    let gcd = getGCD(a, b)
    return (a / gcd) * (b / gcd) * gcd
}

func getGCD(_ a: Int, _ b: Int) -> Int {
    if a == 0 { return b }
    return getGCD(b % a, a)
}

print(solution([2,6,8,14]))