let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int($0)! }

var cacheDic = Dictionary<Int, String>()
var offset = 0

for value in input.sorted() {
    if cacheDic[value] == nil {
        cacheDic[value] = "\(offset)"
        offset += 1
    }
}

print("\(input.map{ cacheDic[$0]! }.joined(separator: " ") )")