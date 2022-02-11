import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var res = [String]()
    
    course.forEach { menuCnt in
        var courseDic = Dictionary<String, Int>()
        orders.sorted().forEach { order in
            func dfs(input: String, currIdx: Int, currCnt: Int, targetCnt: Int, result: String) {
                if currCnt == targetCnt {
                    let sortedResult = String(result.sorted())
                    if let count = courseDic[sortedResult] { courseDic[sortedResult] = count + 1 }
                    else { courseDic[sortedResult] = 1 }
                    return
                }
                
                for idx in currIdx..<input.count {
                    if !visitArr[idx] {
                        visitArr[idx] = true
                        dfs(input: order, currIdx: idx, currCnt: currCnt + 1, targetCnt: targetCnt, result: result + String(input[input.index(input.startIndex, offsetBy: String.IndexDistance(idx))]))
                        visitArr[idx] = false
                    }
                }
            }
            
            var visitArr = Array(repeating: false, count: order.count)
            dfs(input: order, currIdx: 0, currCnt: 0, targetCnt: menuCnt, result: "")
            
            
        }
        let max = courseDic.values.max()
        if max == 1 { return }
        res.append(contentsOf: courseDic.filter({ $0.value == max }).keys)
    }
    
    return res.sorted()
}

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))
print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))
print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))