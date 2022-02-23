// [1920번] 수 찾기
var dic = Dictionary<String, Bool>()
let n = Int(readLine()!)!
readLine()!.split(separator: " ").forEach { dic[String($0)] = true }
let m = Int(readLine()!)!
readLine()!.split(separator: " ").forEach {
    if dic[String($0)] != nil { print("1") }
    else { print("0") }
}