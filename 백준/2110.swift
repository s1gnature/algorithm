// [2110번] 공유기 설치
import Foundation
func isAvailable(_ input: [Int], _ c: Int, _ distance: Int) -> Bool {
    var cnt = 1
    var currIdx = input[0]
    
    input.forEach {
        if $0 - currIdx >= distance {
            cnt += 1
            currIdx = $0
        }
    }
    return cnt >= c ? true : false
}

let nc = readLine()!.split(separator: " ").map{ Int(String($0))! }
var input = [Int]()
(0..<nc[0]).forEach { _ in input.append(Int(readLine()!)!)}
input.sort()

var min = 0
var max = 1000000000
var res = 0

while min < max {
    let mid = (min + max) / 2
    let isAvailable = isAvailable(input, nc[1], mid)
    if isAvailable {
        res = mid
        min = mid + 1
    } else {
        max = mid
    }
}
print(res)