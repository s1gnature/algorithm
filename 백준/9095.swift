import Foundation

let input = [1,2,3]
func dfs(target: Int, sum: Int, res: inout Int) {
    if target == sum {
        res += 1
        return
    } else if target < sum {
        return
    }
    
    input.forEach {
        dfs(target: target, sum: sum + $0, res: &res)
    }
}
let n = Int(readLine()!)!
(0..<n).forEach { _ in
    var res = 0
    let target = Int(readLine()!)!
    dfs(target: target, sum: 0, res: &res)
    print(res)
}