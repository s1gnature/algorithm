import Foundation

while let line = readLine() {
    readLine()!.components(separatedBy: " ").map({ Int($0) })
    let testCase = line.components(separatedBy: " ")
    var flag = true
    let s = testCase[0]
    var t = testCase[1]
    
    for chr in s {
        if let range = t.range(of: String(chr)) {
            t.removeSubrange(t.startIndex...range.lowerBound)
        }else {
            flag = false
            break
        }
    }
    print(flag ? "Yes" : "No")
}