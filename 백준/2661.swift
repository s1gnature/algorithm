import Foundation

var res = ""
let n = Int(readLine()!)!
func dfs() {
    if res.count == n {
        print(res)
        exit(0)
    }
    (1...3).forEach {
        if isGood($0) {
            res += "\($0)"
            dfs()
            res.removeLast()
        }
    }
}
func isGood(_ num: Int) -> Bool {
    if res.count == 0 { return true }
    let res = res + "\(num)"
    for len in 1...res.count/2 {
        let right = res[res.index(res.endIndex, offsetBy: -len)...]
        let left = res[res.index(res.endIndex, offsetBy: -(len*2))..<res.index(res.endIndex, offsetBy: -len)]
        if right == left { return false }
    }
    return true
}
dfs()