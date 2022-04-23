// [11279번] 최대 힙
import Foundation

// Node = (index, value)
typealias Node = (Int, Int)
struct MaxHeap {
    private var nodes: [Int] = [-1]
    
    func print() {
        var from = 1
        var to = 2
        while to < nodes.count {
            Swift.print(nodes[from..<to])
            from = to
            to *= 2
        }
        Swift.print(nodes[from...], terminator: "\n\n")
    }
    
    mutating func insert(value: Int) -> Node {
        nodes.append(value)
        let node = (nodes.count-1, value)
        arrangeUp(newNode: node)
        
        return node
    }
    
    mutating func remove() -> Int? {
        if nodes.count == 1 { return nil }
        nodes.swapAt(1, nodes.count-1)
        let res = nodes.removeLast()
        arrangeDown()
        
        return res
    }

    private func parent(from index: Int) -> Node? {
        if index/2 == 0 { return nil }
        return (index/2, nodes[index/2])
    }
    
    private func leftChild(from index: Int) -> Node? {
        if index <= 0 || index*2 >= nodes.count { return nil }
        return (index*2, nodes[index*2])
    }
    
    private func rightChild(from index: Int) -> Node? {
        if index <= 0 || index*2+1 >= nodes.count { return nil }
        return (index*2+1, nodes[index*2+1])
    }
    
    private mutating func arrangeUp(newNode: Node) {
        var newNode = newNode
        while let parent = parent(from: newNode.0) {
            if parent.1 < newNode.1 {
                nodes.swapAt(parent.0, newNode.0)
                newNode.0 = parent.0
            } else {
                break
            }
        }
    }
    
    private mutating func arrangeDown() {
        if nodes.count == 1 { return }
        var node = (1, nodes[1])
        while let left = leftChild(from: node.0) {
            let right = rightChild(from: node.0) ?? (-1, Int.min)
            let bigger = left.1 < right.1 ? right : left
            if node.1 < bigger.1 {
                nodes.swapAt(node.0, bigger.0)
                node.0 = bigger.0
            } else {
                break
            }
        }
    }
}

var maxHeap = MaxHeap()
(0..<Int(readLine()!)!).forEach { _ in
    let n = Int(readLine()!)!
    if n == 0 { print(maxHeap.remove() ?? 0) }
    else {
        maxHeap.insert(value: n)
    }
}