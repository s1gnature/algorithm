// [1300번] k번째 수
import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var bottom = 1
/*
 B[k]는 k의 값보다 같거나 작을수 밖에 없다.
 B[1]=1, B[2]=2, B[3]=2 이런 식으로 구성되기에 k의 값이 늘어나는 것 보다 B[k]의 개수가 더 많이 증가한다.
 B[k]는 가능한 최댓값이 k까지 가능하기에 이분탐색에서 최댓값을 k로 둔다.
 */
var top = k

// k 값이 1, 2 일때에는 아래 loop문이 제대로 돌아가지 않음. 그러기에 초기값으로 설정
var res = k

/*
 이분탐색 시작. B[k]를 찾는 과정. (mid = B[k])
 각 원소는 i*j로 이루어져 있다. i*j=B[k](mid) 이므로
 mid를 각 '행'으로(1...n) 나누게 되면 해당 B[k]의 '열'값이 나오게 된다.
 여기서 '열'이 의미하는 바는 해당 열의 index값 이전의 값들은 반드시 B[k]의 값보다 작다.
 해당 개수는 열의 전체 갯수(n)를 초과할수는 없으므로 둘 중 작은 값이 B[k]의 값보다 작은 값들의 갯수가 된다.
 이러한 갯수들의 총 합(B[1...k])은 k보다 같거나 커야한다.
 같거나 크다면 이분탐색에서 top의 값을 줄여 정답을 찾아나간다
 작다면 이분탑색에서 bottom의 값을 올려 정답을 찾아나간다
 */
while bottom < top {
    let mid = (bottom + top) / 2 // -> B[k]
    var cnt = 0
    (1...n).forEach { cnt += min(mid/$0, n) }
    if cnt >= k {
        res = mid
        top = mid
    } else {
        bottom = mid + 1
    }
}
print(res)