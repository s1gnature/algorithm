import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var waitCnt = 0
    var location = location
    var queue = priorities
    while true {
        if queue.count == 1 { return waitCnt + 1 }
        let request = queue.removeFirst()
        if queue.max()! > request {
            queue.append(request)
            if location == 0 { location = queue.count - 1 }
            else { location -= 1 }
        }else {
            if location == 0 { return waitCnt + 1 }
            waitCnt += 1
            location -= 1
        }
    }
    return -1
}

print(solution([1], 0))