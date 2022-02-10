import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var res = [Int]()
    var reportCntStackDic = Dictionary<String, Int>()
    var reportIdStackDic = Dictionary<String, [String]>()
    id_list.forEach {
        reportCntStackDic[$0] = 0
        reportIdStackDic[$0] = []
    }
    
    Set(report).forEach {
        let query = $0.split(separator: " ")
        let reporter = String(query[0])
        let abuser = String(query[1])
        
        if !reportIdStackDic[reporter]!.contains(abuser) {
            reportIdStackDic[reporter] = reportIdStackDic[reporter]! + [abuser]
            reportCntStackDic[abuser] = reportCntStackDic[abuser]! + 1
        }
    }
    
    id_list.forEach {
        var cnt = 0
        reportIdStackDic[$0]!.forEach {
            if reportCntStackDic[$0]! >= k { cnt += 1}
        }
        res.append(cnt)
    }
    
    return res
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))
