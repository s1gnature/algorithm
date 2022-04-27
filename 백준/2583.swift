// [2583번] 영역 구하기
let mnk = readLine()!.split(separator: " ").map { Int($0)! }
var map = Array(repeating: Array(repeating: 0, count: mnk[1]), count: mnk[0])
(0..<mnk[2]).forEach { _ in
    let xy = readLine()!.split(separator: " ").map{ Int($0)! }
    (xy[1]..<xy[3]).forEach { y in
        (xy[0]..<xy[2]).forEach { x in
            map[y][x] = 1
        }
    }
}
var res = [Int]()
var map_cache = Array(repeating: Array(repeating: false, count: mnk[1]), count: mnk[0])
func search(_ x: Int, _ y: Int, _ count: inout Int) {
    if map_cache[y][x] == true { return }
    if map[y][x] == 1 { return }
    map_cache[y][x] = true
    count += 1
    if x-1 >= 0 {
        search(x-1, y, &count)
    }
    if y-1 >= 0 {
        search(x, y-1, &count)
    }
    if x+1 < mnk[1]  {
        search(x+1, y, &count)
    }
    if y+1 < mnk[0] {
        search(x, y+1, &count)
    }
}
(0..<mnk[0]).forEach { y in
    (0..<mnk[1]).forEach { x in
        var cnt = 0
        search(x, y, &cnt)
        if cnt != 0 { res.append(cnt) }
    }
}
print(res.count)
var res_sorted = res.sorted().reduce("", {$0 + "\($1) "})
res_sorted.removeLast()
print(res_sorted)