// [10816번] 숫자 카드 2
var res = ""
var dic = Dictionary<String, Int>()
let n = Int(readLine()!)!
readLine()!.split(separator: " ").forEach {
    if let cnt = dic[String($0)] { dic[String($0)] = cnt + 1 }
    else { dic[String($0)] = 1 }
}
let m = Int(readLine()!)!
readLine()!.split(separator: " ").forEach {
    if let cnt = dic[String($0)] { res += "\(cnt) " }
    else { res += "0 " }
}
res.removeLast()
print(res)