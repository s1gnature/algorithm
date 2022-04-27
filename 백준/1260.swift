// [1260번] DFS와 BFS
import Foundation

let nmv = readLine()!.split(separator: " ").map{ Int($0)! }
var graph = [Int: [Int]]()
var dfs_res = [String]()
var bfs_res = [String]()
(0..<nmv[1]).forEach { _ in
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    if let value = graph[input[0]] {
        graph.updateValue((value + [input[1]]).sorted(), forKey: input[0])
    } else {
        graph.updateValue([input[1]], forKey: input[0])
    }
    if let value = graph[input[1]] {
        graph.updateValue((value + [input[0]]).sorted(), forKey: input[1])
    } else {
        graph.updateValue([input[0]], forKey: input[1])
    }
}
func dfs(_ input: Int) {
    if dfs_cached[input] == true { return }
    dfs_cached[input] = true
    dfs_res.append(String(input))
    graph[input]?.forEach {
        dfs($0)
    }
}
func bfs() {
    while !bfs_saved.isEmpty {
        let curr = bfs_saved.removeFirst()
        if bfs_cached[curr] == true { continue }
        bfs_cached[curr] = true
        bfs_res.append(String(curr))
        if let value = graph[curr] {
            bfs_saved.append(contentsOf: value)
        }
    }
    
    if let curr = bfs_cached.firstIndex(of: false) {
        bfs_saved.append(curr)
    }
}
var dfs_cached = Array(repeating: false, count: nmv[0]+1)
dfs(nmv[2])
print(dfs_res.joined(separator: " "))
var bfs_cached = Array(repeating: false, count: nmv[0]+1)
bfs_cached[0] = true
var bfs_saved = [nmv[2]]
bfs()
print(bfs_res.joined(separator: " "))