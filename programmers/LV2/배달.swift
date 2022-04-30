import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var bfs_dic = [Int: [(Int, Int)]]()
    
    road.forEach {
        if let value = bfs_dic[$0[0]] {
            bfs_dic.updateValue(value + [($0[1], $0[2])], forKey: $0[0])
        } else {
            bfs_dic.updateValue([($0[1], $0[2])], forKey: $0[0])
        }
        if let value = bfs_dic[$0[1]] {
            bfs_dic.updateValue(value + [($0[0], $0[2])], forKey: $0[1])
        } else {
            bfs_dic.updateValue([($0[0], $0[2])], forKey: $0[1])
        }
    }
    
    var bfs_cache = [(1, 0)]
    var bfs_isVisited = Array(repeating: false, count: bfs_dic.keys.count + 1)
    var bfs_time = Array(repeating: Int.max, count: bfs_dic.keys.count + 1)
    bfs_time[1] = 0

    func bfs() {
        while !bfs_cache.isEmpty {
            let spot = bfs_cache.removeFirst()
            if let nextSpots = bfs_dic[spot.0] {
                nextSpots.forEach {
                    bfs_time[$0.0] = min(bfs_time[$0.0], bfs_time[spot.0] + $0.1)
                }
                if !bfs_isVisited[spot.0] {
                    bfs_isVisited[spot.0] = true
                    bfs_cache.append(contentsOf: nextSpots)
                }
            }
        }
    }

    bfs()
    
    return bfs_time.filter{ $0 <= k }.count
}
print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3))
print(solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4))