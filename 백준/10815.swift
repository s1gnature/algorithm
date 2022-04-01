import Foundation

let n = Int(readLine()!)!
var dic = [Int: Bool]()
var res = ""
readLine()!.split(separator: " ").forEach {
    let num = Int($0)!
    dic[num] = true
}
let m = Int(readLine()!)!
readLine()!.split(separator: " ").forEach {
    let num = Int($0)!
    if let _ = dic[num] {
        res += "1 "
    } else {
        res += "0 "
    }
}
res.removeLast()
print(res)