import Foundation

let tc1_s = ["sun", "bed", "car"]
let tc1_n = 1
let tc2_s = ["abce", "abcd", "cdx"]
let tc2_n = 2
let tc3_s = ["abzcd","cdzab","abzfg","abzaa","abzbb","bbzaa"]
let tc3_n = 2

func solution(_ strings:[String], _ n:Int) -> [String] {
    var dic = Dictionary<String, String>()
    strings.forEach {
        dic[$0] = String($0[$0.index($0.startIndex, offsetBy: n)...$0.index($0.startIndex, offsetBy: n)])
    }
    return dic.sorted(){
        if $0.value == $1.value { return $0.key < $1.key }
        else { return $0.value < $1.value }
    }.map{ $0.key }
}

print(solution(tc3_s, tc3_n))
