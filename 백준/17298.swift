import Foundation

let n = Int(readLine()!)!
var tc = readLine()!.split(separator: " ").map{ Int(String($0))! }

var res = Array(repeating: "-1", count: tc.count)
var idxStack = [Int]()

for (idx, value) in tc.enumerated() {
    while !idxStack.isEmpty {
        if tc[idxStack.last!] < value { res[idxStack.popLast()!] = String(value) }
        else { break }
    }
    
    idxStack.append(idx)
}

print(res.joined(separator: " "))