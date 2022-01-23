import Foundation

func solution(_ n:Int) -> [Int] {
    var arr = [[Int]]()
    for value in 1...n {
        arr.append(Array(repeating: 0, count: value))
    }
    
    var column = -1
    var row = 0
    var number = 1
    
    for len in stride(from: n, to: 0, by: -3) {
        for _ in 0..<len {
            column += 1
            arr[column][row] = number
            number += 1
        }
        for _ in 0..<(len - 1) {
            row += 1
            arr[column][row] = number
            number += 1
        }
        for _ in 0..<((len - 2) < 0 ? 0 : (len - 2)) {
            column -= 1
            row -= 1
            arr[column][row] = number
            number += 1
        }
    }
    
    return arr.flatMap({ $0 })
}