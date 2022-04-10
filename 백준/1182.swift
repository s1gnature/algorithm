// [1182번] 부분수열의 합
import Foundation

let ns = readLine()!.split(separator: " ").map{ Int($0)! }
let input = readLine()!.split(separator: " ").map{ Int($0)! }
var res = 0
func dfs(_ target: Int, _ currIdx: Int, _ sum: Int, _ depth: Int, _ res: inout Int) {
    if depth != 0 && target == sum {
        res += 1
    }
    if currIdx >= input.count {
        return
    }
    (currIdx..<input.count).forEach {
        dfs(target, $0+1, sum+input[$0], depth+1, &res)
    }
}
dfs(ns[1], 0, 0, 0, &res)
print(res)