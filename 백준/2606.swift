// [2606번] 바이러스
import Foundation

let n = Int(readLine()!)!
let l = Int(readLine()!)!
var graph = [Int: [Int]]()
var checker = Array(repeating: false, count: n+1)
var res = Set<Int>()
(0..<l).forEach { _ in
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    if let value = graph[input[0]] {
        graph.updateValue(value + [input[1]], forKey: input[0])
    } else {
        graph.updateValue([input[1]], forKey: input[0])
    }
    if let value = graph[input[1]] {
        graph.updateValue(value + [input[0]], forKey: input[1])
    } else {
        graph.updateValue([input[0]], forKey: input[1])
    }
}
func dfs(_ input: Int) {
    if checker[input] == true { return }
    checker[input] = true
    res.insert(input)
    if let values = graph[input] {
        values.forEach {
            dfs($0)
        }
    }
}
dfs(1)
print(res.count-1)