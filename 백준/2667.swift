// [2667번] 단지번호붙이기
import Foundation

let n = Int(readLine()!)!
var map = [[(Int, Bool)]]()
(0..<n).forEach{ _ in
    map.append(readLine()!.map{ (Int(String($0))!, false) })
}
var res = [Int]()
func search(_ x: Int, _ y: Int, _ cnt: inout Int) {
    if map[y][x].0 == 1 && map[y][x].1 == false {
        map[y][x].1 = true
        cnt += 1
        if y+1 < n { search(x, y+1, &cnt) }
        if y-1 >= 0 { search(x, y-1, &cnt) }
        if x+1 < n { search(x+1, y, &cnt) }
        if x-1 >= 0 { search(x-1, y, &cnt) }
    }
}
(0..<n).forEach{ y in
    (0..<n).forEach{ x in
        if map[y][x].0 == 0 || map[y][x].1 == true { return }
        var cnt = 0
        search(x, y, &cnt)
        if cnt != 0 { res.append(cnt) }
    }
}
print(res.count)
res.sorted().forEach {
    print($0)
}