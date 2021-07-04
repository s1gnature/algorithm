import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    // idx = 0 은 사용 x
    var challengeArr = Array(repeating: 0, count: N+1)
    var reachedArr = Array(repeating: 0, count: N+1) 
    // init Dic
    var stageDic = Dictionary<Int, Double>()
    for stage in 1...N { stageDic[stage] = 0 }

    for playerStage in stages {
        for stage in 1..<playerStage {
            reachedArr[stage] += 1
        }
        if playerStage != N+1 { 
            challengeArr[playerStage] += 1 
            reachedArr[playerStage] += 1
        }
    }

    for stage in 1...N {
        if reachedArr[stage] == 0 { stageDic[stage] = 0 }
        else {stageDic[stage] = Double(challengeArr[stage]) / Double(reachedArr[stage])}
    }
    var sortDic = stageDic.sorted{ 
        if $0.1 == $1.1 { return $0 < $1}
        else { return $0.1 > $1.1}
    }
    var result = [Int]()
    for value in sortDic { result.append(value.key) }
    print(sortDic)
    return result
}

print(solution(4, [3,3,3,3,3]	))