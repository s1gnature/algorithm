// [11444번] 피보나치 수 6
/*
 피보나치수의 행렬 점화식은 다음과 같음.
 Fn+1 Fn   [1 1]^n
 Fn Fn-1   [1 0]
 제곱수로 늘리고 나머지 홀수 만큼 부족한 행렬을 곱해서 목표 n을 만들기 위해서 res_matrix를 단위 행렬로 둠.
 그리고 n /= 2 하는데 항상 마지막에 1이 남기 때문에 결과적으로 n = 1 일 때 (제곱된 행렬) * (홀수 행렬) = Fn 이 가능함.
 기존에 썼던 제곱 방식은 메모리 초과로 인하여 loop 방식으로 수정
 Fn을 위해서 n번 곱할 필요 없이 Fn+1을 찾으면 되기에 n-1을 목표 계산 값으로 정함.
 */
var n = Int(readLine()!)! - 1
var pow_matrix = [[1, 1], [1, 0]]
var res_matrix = [[1, 0], [0, 1]]
func quick_pow() {
    while n > 0 {
        if n % 2 == 1 { res_matrix = matrix_pow(res_matrix, pow_matrix) }
        pow_matrix = matrix_pow(pow_matrix, pow_matrix)
        n /= 2
    }
}
func matrix_pow(_ m1: [[Int]], _ m2: [[Int]]) -> [[Int]] {
    var res = Array(repeating: Array(repeating: 0, count: 2), count: 2)
    (0..<2).forEach { y in
        (0..<2).forEach { x in
            var sum: Int = 0
            (0..<2).forEach { idx in sum += m1[y][idx] * m2[idx][x] }
            res[y][x] = sum % 1000000007
        }
    }
    return res
}
quick_pow()
print(res_matrix[0][0] % 1000000007)