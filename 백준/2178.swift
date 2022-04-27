// [2178번] 미로탐색
import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
var map = [[(Int, Bool)]]()
(0..<nm[0]).forEach{ _ in
    map.append(readLine()!.map{ (Int(String($0))!, false) })
}
map[0][0].1 = true
var bfs_cache = [(0, 0)]
func bfs() {
    while !bfs_cache.isEmpty {
        let curr = bfs_cache.removeFirst()
        if curr.1+1 < nm[1] {
            if map[curr.0][curr.1+1].0 != 0 && map[curr.0][curr.1+1].1 == false {
                map[curr.0][curr.1+1].1 = true
                map[curr.0][curr.1+1].0 += map[curr.0][curr.1].0
                bfs_cache.append((curr.0, curr.1+1))
            }
        }
        if curr.1-1 >= 0 {
            if map[curr.0][curr.1-1].0 != 0 && map[curr.0][curr.1-1].1 == false {
                map[curr.0][curr.1-1].1 = true
                map[curr.0][curr.1-1].0 += map[curr.0][curr.1].0
                bfs_cache.append((curr.0, curr.1-1))
            }
        }
        if curr.0+1 < nm[0] {
            if map[curr.0+1][curr.1].0 != 0 && map[curr.0+1][curr.1].1 == false {
                map[curr.0+1][curr.1].1 = true
                map[curr.0+1][curr.1].0 += map[curr.0][curr.1].0
                bfs_cache.append((curr.0+1, curr.1))
            }
        }
        if curr.0-1 >= 0 {
            if map[curr.0-1][curr.1].0 != 0 && map[curr.0-1][curr.1].1 == false {
                map[curr.0-1][curr.1].1 = true
                map[curr.0-1][curr.1].0 += map[curr.0][curr.1].0
                bfs_cache.append((curr.0-1, curr.1))
            }
        }
    }
}
bfs()
print(map[nm[0]-1][nm[1]-1].0)