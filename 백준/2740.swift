// [2740번] 행렬곱셈
let nm = readLine()!.split(separator: " ").map{ Int($0)! }
var a = [[Int]]()
(0..<nm[0]).forEach { _ in a.append(readLine()!.split(separator: " ").map{ Int($0)! }) }
let mk = readLine()!.split(separator: " ").map{ Int($0)! }
var b = [[Int]]()
(0..<mk[0]).forEach { _ in b.append(readLine()!.split(separator: " ").map{ Int($0)! }) }

func mat_multiplier(_ m1: [[Int]], _ m2: [[Int]]) -> [[Int]] {
    var res = Array(repeating: Array(repeating: 0, count: mk[1]), count: nm[0])
    (0..<nm[0]).forEach { n in
        (0..<mk[1]).forEach { k in
            var sum = 0
            (0..<nm[1]).forEach { sum += m1[n][$0] * m2[$0][k] }
            res[n][k] = sum
        }
    }
    return res
}
mat_multiplier(a, b).forEach {
    var res = $0.reduce("", { $0 + "\($1) "})
    res.removeLast()
    print(res)
}