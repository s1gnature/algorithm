// [15686번] 치킨 배달
import Foundation

func chickenDistance(_ spot1: [Int], _ spot2: [Int]) -> Int {
    return abs(spot1[0] - spot2[0]) + abs(spot1[1] - spot2[1])
}
let nm = readLine()!.split(separator: " ").map{ Int($0)! }
var home = [[Int]]()
var store = [[Int]]()
var res = Int.max
(0..<nm[0]).forEach { y in
    readLine()!.split(separator: " ").map{ Int($0)! }.enumerated().forEach { (x, value) in
        if value == 1 {
            home.append([x, y])
        } else if value == 2 {
            store.append([x, y])
        }
    }
}
func dfs(_ currIdx: Int, _ selectedStore: [[Int]]) {
    if selectedStore.count == nm[1] {
        var totalDistance = 0
        home.forEach { homeSpot in
            var distance = Int.max
            selectedStore.forEach { storeSpot in
                distance = min(distance, chickenDistance(homeSpot, storeSpot))
            }
            totalDistance += distance
        }
        res = min(res, totalDistance)
        return
    }
    (currIdx..<store.count).forEach {
        dfs($0+1, selectedStore + [store[$0]])
    }
}
dfs(0, [])
print(res)