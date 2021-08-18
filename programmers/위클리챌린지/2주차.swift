import Foundation

func solution(_ scores:[[Int]]) -> String {
    var result = ""
    for column in 0..<scores.count {
        var max = 0
        var min = 100
        var sum = 0
        for row in 0..<scores.count {
            if max < scores[row][column] { max = scores[row][column] }
            else if min > scores[row][column] { min = scores[row][column] }
            sum += scores[row][column]
        }
        if max == scores[column][column] { result += getScore(Double(sum - max) / Double(scores.count-1)) }
        else if min == scores[column][column] { result += getScore(Double(sum - min) / Double(scores.count-1)) }
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

print(solution([[100,90,98,88,65],[50,45,99,85,77],[47,88,95,80,67],[61,57,100,80,65],[24,90,94,75,65]]))