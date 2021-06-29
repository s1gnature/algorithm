import Foundation

var tc1_board = [
    [0,0,0,0,0],
    [0,0,1,0,3],
    [0,2,5,0,1],
    [4,2,4,4,2],
    [3,5,1,3,1]
    ]
var tc1_moves = [1,5,3,5,1,2,1,4]
// tc1 result = 4

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var tmpBoard = board
    var resultStack = [Int]()
    var removeCnt = 0
    for value in moves {
        var crainIdx = value - 1
        
        for y in 0..<board.count {
            var pickValue = tmpBoard[y][crainIdx]
            if pickValue == 0 { continue }
            tmpBoard[y][crainIdx] = 0
            if resultStack.count == 0 { resultStack.append(pickValue) }
            else {
                if resultStack.last! == pickValue {
                    resultStack.removeLast()
                    removeCnt += 2
                }
                else { resultStack.append(pickValue) }
            }
            break
        }
    }
    
    print(tmpBoard)
    print(resultStack)
    
    return removeCnt
}

print(solution(tc1_board, tc1_moves))
