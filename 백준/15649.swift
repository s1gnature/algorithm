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
    
    (1...input.last!).forEach {
        if checker[$0 - 1] { return }
        checker[$0 - 1] = true
        dfs(input: input, currIdx: $0 + 1, targetCount: targetCount, res: res + ["\($0)"])
        checker[$0 - 1] = false
    }
}

let tc = (1...m)
dfs(input: tc, currIdx: 0, targetCount: n, res: [])
