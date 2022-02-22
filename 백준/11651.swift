// [11651번] 좌표 정렬하기 2
let n = Int(readLine()!)!
var arr = [[Int]]()
(0..<n).forEach { _ in arr.append(readLine()!.split(separator: " ").map{ Int($0)! }) }
arr.sorted {
    if $0[1] == $1[1] { return $0[0] < $1[0] }
    else { return $0[1] < $1[1] }
}.forEach {
    print("\($0[0]) \($0[1])")
}