import Foundation

func solution(_ land:[[Int]]) -> Int{
    var dp = Array(repeating: [0, 0, 0, 0], count: land.count)
    dp[0] = land.first!

    for column in 1..<land.count {
        for row in 0..<4 {
            for index in 0..<4 {
                if index == row { continue }
                if dp[column][row] < (dp[column-1][index] + land[column][row]) { dp[column][row] = dp[column-1][index] + land[column][row] }
            }
        }
    }
    
    return dp.last!.max()!
}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))