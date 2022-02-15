/*
 [9663번] N-Queen
 setQueen(at: 0)으로 시작
 setQueen 내부에서 0~input 까지 루프를 돌기 때문에 (0,1) ~ (0,input) 까지 다 돌고 (1,0) ~~~ 이런 식으로 모든 칸에 다 놓아보게됨.
 canSet은 해당 위치에 퀸을 놓는게 가능하다면 다음 index(행) 으로 넘어가게 됨.
 그게 아니라면 arr[at] = $0 으로 인해서 그 다음 위치에 놓아보게 됨. 이렇게 퀸을 놓는 자리를 한 칸 씩 옮겨가면서 검사함.
 arr => 이때까지 놓인 퀸을 담은 배열임.
 해당 배열을 처음~내가 놓을 위치-1 까지 검사하면서 해당 위치에 퀸이 놓여져 있다면 둘 수 없음.
 또한 대각선 위치에 놓여져 있어도 둘 수 없기 때문에 (x1 - x2) == (y1 - y2) 를 만족한다면 대각선에 존재하는 것임.
 
 이해 못 했다가 한 것들)
 1. arr은 전역 변수인데 dfs로 순회하면 이전 결과에 의해 배열이 오염되었지 않나?
 -> 내가 놓을 자리가 유효한지는 현재 놓을 위치 이전에 대한 것들만 검사하기때문에 한번 깊이를 들어갔다 나와도(오염되어 있어도)
    그 오염된 값을은 어차피 검사를 하지 않음. 이전 값들에 대해서만 비교해서 내가 놓을 수 있나 없나만 알면 되기 때문에.
 2. 1차원 배열이 가능한 이유?
 -> 2차원 배열에 true, false로 존재 유무를 검사할 수도 있는데 이게 아니라 'arr[행] = 열' 이렇게 index와 값으로 좌표 위치를
    표현할 수 있음. 그래서 1차원 배열이 가능한 것.
 */
import Foundation

let input = Int(readLine()!)!
var res = 0
var arr = Array(repeating: 0, count: input)

func setQueen(at: Int) {
    if at == input {
        res += 1
        return
    }
    
    (0..<input).forEach {
        arr[at] = $0
        if canSet(at: at) { setQueen(at: at + 1) }
    }
}

func canSet(at: Int) -> Bool {
    for idx in 0..<at {
        if arr[idx] == arr[at] || ((at - idx) == abs(arr[at] - arr[idx])) { return false }
    }
    return true
}

setQueen(at: 0)
print(res)
