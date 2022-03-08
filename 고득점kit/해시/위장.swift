import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic = Dictionary<String, Int>()
    var res = 1
    clothes.forEach {
        if let cnt = dic[$0[1]] { dic[$0[1]] = cnt + 1}
        else { dic[$0[1]] = 1 }
    }
    if dic.keys.count == 1 { return dic.values.first! }
    dic.values.forEach {
        res *= $0 + 1
    }
    return res - 1
}