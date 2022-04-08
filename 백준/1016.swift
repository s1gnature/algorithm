// [1016번] 제곱ㄴㄴ수
import Foundation

let input = readLine()!.split(separator: " ").map{ Int64(String($0))! }
let (min, max) = (input[0], input[1])
var res = Int(max - min + 1)
var arr = Array(repeating: true, count: res)
var pivot: Int64 = 2
while true {
    let powPivot = pivot*pivot
    if powPivot > max { break }
    let multiplier = (min/powPivot) == 0 ? 1 : (min/powPivot)
    var divisor: Int64 = powPivot*multiplier
    if divisor < min {
        divisor += powPivot
    }
    while divisor <= max {
        if arr[Int(divisor-min)] {
            arr[Int(divisor-min)] = false
            res -= 1
        }
        divisor += powPivot
    }
    pivot += 1
}
print(res)