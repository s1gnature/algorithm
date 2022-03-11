// [2018카카오블라인드] [1차]뉴스 클러스터링
import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = str1.uppercased()
    let str2 = str2.uppercased()
    let set1 = getMultipleSet(str1)
    let set2 = getMultipleSet(str2)
    let res1 = intersectionCnt(set1, set2)
    let res2 = unionCnt(set1, set2, res1)
    
    if res2 < 1 { return 65536 }
    return Int(trunc(res1 / res2 * 65536))
}
func getMultipleSet(_ str: String) -> [(String, Int)] {
    var res = [(String, Int)]()
    (0..<str.count-1).forEach { idx in
        let chr1 = str[str.index(str.startIndex, offsetBy: String.IndexDistance(idx))]
        let chr2 = str[str.index(str.startIndex, offsetBy: String.IndexDistance(idx+1))]
        if !chr1.isLetter || !chr2.isLetter { return }
        let newValue = String(chr1) + String(chr2)
        var flag = true
        for (idx, value) in res.enumerated() {
            if value.0 == newValue {
                res[idx].1 += 1
                flag.toggle()
                break
            }
        }
        if flag { res.append((newValue, 1)) }
    }
    return res
}
func intersectionCnt(_ set1: [(String, Int)], _ set2: [(String, Int)]) -> Double {
    var res = 0
    set1.forEach { element1 in
        set2.forEach { element2 in
            if element1.0 == element2.0 { res += min(element1.1, element2.1) }
        }
    }
    return Double(res)
}
func unionCnt(_ set1: [(String, Int)], _ set2: [(String, Int)], _ intersectionCnt: Double) -> Double {
    var res = 0
    set1.forEach { res += $0.1 }
    set2.forEach { res += $0.1 }
    return Double(res) - intersectionCnt
}