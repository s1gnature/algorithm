import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var resultArr = [Int]()
    var endDateArr = Array(repeating: 0, count: progresses.count)
    for idx in 0..<progresses.count {
        endDateArr[idx] = Int(ceil((100.0 - Double(progresses[idx])) / Double(speeds[idx])))
    }
    while endDateArr.count != 0 {
        var endJobCnt = 1
        var firstJob = endDateArr.removeFirst()
        for job in endDateArr {
            if job <= firstJob {
                endDateArr.removeFirst()
                endJobCnt += 1
            }else { break }
        }
        resultArr.append(endJobCnt)
        endJobCnt = 1
    }
    return resultArr
}

print(solution([93, 30, 55], [1, 30, 5]))