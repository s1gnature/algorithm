import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var resultArr = [Int]()
    var endDateArr = Array(repeating: 0, count: progresses.count)
    for idx in 0..<progresses.count {
        endDateArr[idx] = Int(ceil((100.0 - Double(progresses[idx])) / Double(speeds[idx])))
    }
    var jobCnt = 1
    var pivot = endDateArr.removeFirst()
    endDateArr.forEach {
        if $0 <= pivot { jobCnt += 1}
        else { 
            resultArr.append(jobCnt)
            pivot = $0
            jobCnt = 1
        }
    }
    resultArr.append(jobCnt)
    return resultArr
}

print(solution([93, 30, 55], [1, 30, 5]))