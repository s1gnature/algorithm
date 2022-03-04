// [10830번] 행렬 제곱
let nb = readLine()!.split(separator: " ").map{ Int(String($0))! }
var m = [[Int]]()
(0..<nb[0]).forEach { _ in m.append(readLine()!.split(separator: " ").map{ Int(String($0))! }) }

func quick_pow(_ m: [[Int]], _ k: Int) -> [[Int]] {
    if k == 1 { return m }
    let pow = quick_pow(m, k / 2)
    return k % 2 == 1 ? matrix_pow(matrix_pow(pow, pow), m) : matrix_pow(pow, pow)
}
func matrix_pow(_ m1: [[Int]], _ m2: [[Int]]) -> [[Int]] {
    let len = Int(nb[0])
    var res = Array(repeating: Array(repeating: 0, count: len), count: len)
    (0..<len).forEach { y in
        (0..<len).forEach { x in
            var sum: Int = 0
            (0..<len).forEach { idx in sum += m1[y][idx] * m2[idx][x] }
            res[y][x] = sum % 1000
        }
    }
    return res
}
quick_pow(m, nb[1]).forEach {
    var res = $0.reduce("", {$0 + "\($1 % 1000) "})
    res.removeLast()
    print(res)
}