// [12015번] 가장 긴 증가하는 부분 수열 2
import Foundation
func binarySearch_insert(_ input: inout [Int], _ value: Int) {
    var bottomIdx = 0
    var topIdx = input.count
    var midIdx = 0
    while bottomIdx <= topIdx {
        midIdx = (bottomIdx + topIdx) / 2
        if input[midIdx] < value {
            bottomIdx = midIdx + 1
        } else if input[midIdx] > value {
            topIdx = midIdx - 1
        } else {
            return
        }
    }
    input[bottomIdx] = value
}

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var res = [input[0]]
input.forEach {
    if res.last! == $0 { return }
    else if res.last! > $0 { binarySearch_insert(&res, $0) }
    else { res.append($0) }
}
print(res.count)