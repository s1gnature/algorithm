import Foundation

struct DoublePriorityQueue {
    private var queue = [Int]()
    
    mutating func insert(_ value: Int) {
        queue.append(value)
    }
    
    mutating func removeMax() {
        if queue.isEmpty { return }
        var sortedQueue = queue.sorted()
        sortedQueue.removeLast()
        queue = sortedQueue
    }
    
    mutating func removeMin() {
        if queue.isEmpty { return }
        var sortedQueue = queue.sorted(by: >)
        sortedQueue.removeLast()
        queue = sortedQueue.reversed()
    }
    
    func result() -> [Int] {
        if queue.isEmpty { return [0, 0] }
        let sortedQueue = queue.sorted()
        
        return [sortedQueue.last!, sortedQueue.first!]
    }
}

func solution(_ operations:[String]) -> [Int] {
    var dpq = DoublePriorityQueue()
    
    operations.forEach {
        let oper = $0.split(separator: " ")
        switch oper[0] {
        case "I":
            dpq.insert(Int(oper[1])!)
        case "D":
            if oper[1] == "1" {
                dpq.removeMax()
            } else {
                dpq.removeMin()
            }
        default: break
        }
    }
    return dpq.result()
}

print(solution(["I 16","D 1"]))
print(solution(["I 7","I 5","I -5","D -1"]))
print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]))