// [1629번] 곱셈
let input = readLine()!.split(separator: " ").map{ UInt(String($0))! }

func quick_pow(_ n: UInt, _ k: UInt, _ d: UInt) -> UInt {
    if k == 0 { return 1 }
    else if k == 1 { return n % d }
    let pow = quick_pow(n, k / 2, d)
    return (k % 2 == 1 ? pow * pow % d * n : pow * pow) % d
}

print(quick_pow(input[0], input[1], input[2]))