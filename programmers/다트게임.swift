import Foundation

func solution(_ dartResult:String) -> Int {
    var calcArr = [Int]()
    var numBuffer = ""
    for chr in dartResult {
        if chr.isNumber {
            numBuffer += String(chr)
            continue
        }else if !numBuffer.isEmpty {
            calcArr.append(Int(numBuffer)!)
            numBuffer = ""
        }
        if chr.isLetter {
            var score = calcArr.popLast()!
            switch String(chr) {
            case "S": calcArr.append(score)
            case "D": calcArr.append(score * score)
            case "T": calcArr.append(score * score * score)
            default: return -1
            }
        }else {
            var score = calcArr.popLast()!
            if String(chr) == "#" {
                score = -score
                calcArr.append(score)
            }else {
                if calcArr.count == 0 {
                    score = score * 2
                    calcArr.append(score)
                }else {
                    var prevScore = calcArr.popLast()!
                    prevScore = prevScore * 2
                    score = score * 2
                    calcArr.append(prevScore)
                    calcArr.append(score)
                }
            }
        }
    }
    return calcArr.reduce(0, +)
}
var tmp = "1D#2S*3S"
print(solution(tmp))