import Foundation

let tc = readLine()!.split(separator: " ").map{ Int($0)! }
let n = tc[0]
let r = tc[1]

let countOfN = countFactorsOf(n)
let countOfR = countFactorsOf(r)
let countOfNR = countFactorsOf(n - r)

let countOfTwo = countOfN[0] - countOfR[0] - countOfNR[0]
let countOfFive = countOfN[1] - countOfR[1] - countOfNR[1]
let res = min(countOfTwo, countOfFive)

if res < 0 { print(0) }
else { print(res) }

func countFactorsOf(_ n: Int) -> [Int] {
    var twoDivider = 2
    var fiveDivider = 5
    var countOfTwo = 0
    var countOfFive = 0
    
    while n >= fiveDivider {
        countOfFive += (n / fiveDivider)
        fiveDivider *= 5
    }
    
    while n >= twoDivider {
        countOfTwo += (n / twoDivider)
        twoDivider *= 2
    }
    
    return [countOfTwo, countOfFive]
}