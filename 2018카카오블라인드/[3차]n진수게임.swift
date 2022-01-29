func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var res = ""
    var num = 0
    var remainPlayer = p - 1

    while res.count != t {
        let radixNum = String(String(num, radix: n))
        for idx in stride(from: remainPlayer, to: radixNum.count, by: m) {
            let num = String(radixNum[radixNum.index(radixNum.startIndex, offsetBy: String.IndexDistance(idx))])
            res += num
            if res.count == t { break }
        }
        remainPlayer = (m - ((radixNum.count - remainPlayer) % m)) % m
        num += 1
    }
    return res.uppercased()
}