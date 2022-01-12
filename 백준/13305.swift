let n = Int(readLine()!)!
let rangeList = readLine()!.split(separator: " ").map{ Int($0)! }
let costList = readLine()!.split(separator: " ").map{ Int($0)! }

var sumOfCost = costList[0] * rangeList[0]
var minCost = costList[0]

for idx in 1..<n-1 {
    if minCost > costList[idx] { minCost = costList[idx] }
    sumOfCost += minCost * rangeList[idx]
}

print(sumOfCost)