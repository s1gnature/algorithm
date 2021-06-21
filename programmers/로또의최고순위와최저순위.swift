import Foundation

let tc1_lottos = [44, 1, 0, 0, 31, 25]
let tc1_win_nums = [31, 10, 45, 1, 6, 19]
let tc2_lottos = [0, 0, 0, 0, 0, 0]
let tc2_win_nums = [38, 19, 20, 40, 15, 25]
let tc3_lottos = [45, 4, 35, 20, 3, 9]
let tc3_win_nums = [20, 9, 3, 45, 4, 35]

func getRank(matchCnt: Int) -> Int {
    switch matchCnt {
    case 0...1: return 6
    case 2: return 5
    case 3: return 4
    case 4: return 3
    case 5: return 2
    case 6: return 1
    default:
        return 0
    }
}
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var resultArr = [Int]()
    var matchCnt = 0
    var eraseCnt = 0
    lottos.forEach() {
        if $0 == 0 {
            eraseCnt += 1
            return
        }
        if win_nums.index(of: $0) != nil {
            matchCnt += 1
        }
    }
    var maxMatch = matchCnt + eraseCnt
    return [getRank(matchCnt: maxMatch), getRank(matchCnt: matchCnt)]
}

print(solution(tc3_lottos, tc3_win_nums))
