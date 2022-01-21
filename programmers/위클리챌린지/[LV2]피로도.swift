import Foundation

func permutation(dungeons: [[Int]], k: Int, res: inout Int, currDungeonsCount count: Int) {
    res = max(res, count)
    for idx in 0..<dungeons.count {
        if (k - dungeons[idx][0] >= 0) && ((k - dungeons[idx][1]) >= 0) {
            var lastOfDungeons = dungeons
            let lastOfK = k - dungeons[idx][1]
            lastOfDungeons.remove(at: idx)
            permutation(dungeons: lastOfDungeons, k: lastOfK, res: &res, currDungeonsCount: count + 1)
        }
    }
}

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var count = 0
    
    permutation(dungeons: dungeons, k: k, res: &count, currDungeonsCount: 0)
    
    return count
}

print(solution(80, [[80,20],[50,40],[30,10]]))
/* wrong solve (14/17) */
//import Foundation
//
//func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
//    var k = k
//    var dungeons = dungeons
//    var count = 0
//
//    dungeons.sort{
//        if ($0[0]-$0[1] == $1[0]-$1[1]) { return ($0[0] > $1[0]) }
//        else { return ($0[0]-$0[1] > $1[0]-$1[1]) }
//    }
//
//    dungeons.forEach {
//        if k >= $0[0] && k >= $0[1] {
//            k -= $0[1]
//            count += 1
//        }
//    }
//    return count
//}