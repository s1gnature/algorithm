import Foundation

let tc1_answers = [1,2,3,4,5]
// return 1
let tc2_answers = [1,3,2,4,2]
// return 1,2,3

// loop
let p1 = [1,2,3,4,5]
let p2 = [2,1,2,3,2,4,2,5]
let p3 = [3,3,1,1,2,2,4,4,5,5]

func solution(_ answers:[Int]) -> [Int] {
    var resultArr = [Int]()
    var p1Score = 0
    var p2Score = 0
    var p3Score = 0
    
    answers.indices.forEach() {
        let answer = answers[$0]
        if answer == p1[$0 % 5] { p1Score += 1 }
        if answer == p2[$0 % 8] { p2Score += 1}
        if answer == p3[$0 % 10] { p3Score += 1}
    }
    let maxScore = max(p1Score, p2Score, p3Score)
    var scoreArr = [p1Score, p2Score, p3Score]
    scoreArr.indices.forEach {
        if scoreArr[$0] == maxScore { resultArr.append($0+1)}
    }
    return resultArr
}

print(solution(tc2_answers))
