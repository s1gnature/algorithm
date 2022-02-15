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
    
    if currIdx > input.last! { return }
    
    for idx in currIdx...input.last! {
        if checker[idx - 1] { return }
        checker[idx - 1] = true
        dfs(input: input, currIdx: idx + 1, targetCount: targetCount, res: res + ["\(idx)"])
        checker[idx - 1] = false
    }
}

let tc = (1...m)
dfs(input: tc, currIdx: 1, targetCount: n, res: [])
