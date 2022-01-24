import Foundation

func solution(_ board:[[Int]]) -> Int {
    var board = board
    var maxLen = 0
    
    for y in 1..<board.count {
        for x in 1..<board.first!.count {
            let left = board[y][x-1]
            let up = board[y-1][x]
            let upLeft = board[y-1][x-1]
            
            if left != 0 && up != 0 && upLeft != 0 && board[y][x] != 0 {
                let value = min(min(left, up), upLeft) + 1
                board[y][x] = value
                maxLen = max(maxLen, value)
            }
        }
    }
    
    if maxLen == 0 {
        for y in 0..<board.count {
            for x in 0..<board[y].count {
                if board[y][x] == 1 { return 1 }
            }
        }
    }
    
    return maxLen * maxLen
}