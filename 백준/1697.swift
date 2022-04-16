// [1697번] 숨바꼭질
import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dic = [Int: Int]()
var bfs_cache = [nk[0]]
dic[nk[0]] = 0
func search() {
    while !bfs_cache.isEmpty {
        let p = bfs_cache.removeFirst()
        let time = dic[p]! + 1
        if p-1 >= 0 {
            if dic[p-1] == nil {
                dic[p-1] = time
                bfs_cache.append(p-1)
            }
        }
        if p+1 <= 100000 {
            if dic[p+1] == nil {
                dic[p+1] = time
                bfs_cache.append(p+1)
            }
        }
        if p*2 <= 100000 {
            if dic[p*2] == nil {
                dic[p*2] = time
                bfs_cache.append(p*2)
            }
        }
    }
}
search()
print(dic[nk[1]]!)