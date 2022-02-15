// [15652번] N과 M(4)
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let m = input[0]
let n = input[1]
var res = [String]()
var checker = Array(repeating: false, count: m)

func dfs(input: ClosedRange<Int>, currIdx: Int, targetCount: Int, res: [String]) {
    if res.count == targetCount {
        print(res.joined(separator: " "))
        return
    }
    
    for idx in currIdx...input.last! {
        checker[idx - 1] = true
        dfs(input: input, currIdx: idx, targetCount: targetCount, res: res + ["\(idx)"])
        checker[idx - 1] = false
    }
}

let tc = (1...m)
dfs(input: tc, currIdx: 1, targetCount: n, res: [])
