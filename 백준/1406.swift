import Foundation

var left = readLine()!
var right = ""

(0..<Int(readLine()!)!).forEach { _ in
    let input = readLine()!
    switch input.first! {
    case "L":
        if let value = left.popLast() {
            right.append(value)
        }
    case "D":
        if let value = right.popLast() {
            left.append(value)
        }
    case "B":
        left.popLast()
    default:
        left.append(String(input.last!))
    }
}
print((left+right.reversed()))