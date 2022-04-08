// [1016번] 제곱ㄴㄴ수
import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (min, max) = (input[0], input[1])

var dic: [Int: Bool] = {
    var dic = [Int: Bool]()
    (min...max).forEach {
        dic[$0] = true
    }
    return dic
}()
var res = max - min + 1
var pivot = 2
while true {
    let powPivot = pivot*pivot
    if powPivot > max { break }
    let multiplier = (min / powPivot) == 0 ? 1 : (min / powPivot)
    for divisor in stride(from: powPivot*multiplier, to: max+1, by: +powPivot) {
        if let value = dic[divisor] {
            if value {
                dic[divisor] = false
                res -= 1
            }
        }
    }
    pivot += 1
}
print(res)