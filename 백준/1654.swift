// [1654번] 랜선 자르기
let kn = readLine()!.split(separator: " ").map{ Int($0)! }
var input = [Int]()
(0..<kn[0]).forEach{ _ in input.append(Int(readLine()!)!) }
input.sort()
var res = 0
var start = 1
var end = input.last!


while (start <= end) {
    let mid = (start + end) / 2
    var cnt = 0
    input.forEach { cnt += ($0 / mid) }
    if cnt >= kn[1] {
        if res < mid { res = mid }
        start = mid + 1
    } else {
        end = mid - 1
    }
}
print(res)