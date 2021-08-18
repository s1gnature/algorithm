import Foundation

func solution(_ scores:[[Int]]) -> String {
    var result = ""
    for column in 0..<scores.count {
        var max = 0
        var min = 100
        var isOnlyMax = true
        var isOnlyMin = true
        var sum = 0
        for row in 0..<scores.count {
            if max < scores[row][column] {
                max = scores[row][column]
                isOnlyMax = true
            }
            else if max == scores[row][column] { isOnlyMax = false }
            
            if min > scores[row][column] {
                min = scores[row][column]
                isOnlyMin = true
            }
            else if min == scores[row][column] { isOnlyMin = false }
            sum += scores[row][column]
        }
        if max == scores[column][column] && isOnlyMax { result += getScore(Double(sum - max) / Double(scores.count-1)) }
        else if min == scores[column][column] && isOnlyMin { result += getScore(Double(sum - min) / Double(scores.count-1)) }
        else { result += getScore(Double(sum) / Double(scores.count))}
    }
    return result
}

func getScore(_ avg: Double) -> String {
    switch avg {
        case 90...: return "A"
        case 80..<90: return "B"
        case 70..<80: return "C"
        case 50..<70: return "D"
        default: return "F"
    }
}
print(solution([[75, 50, 100], [75, 100, 20], [100, 100, 20]]))
