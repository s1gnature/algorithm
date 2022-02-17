// [14888번] 연산자 끼워넣기
let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{ Int($0)! }
let operands = readLine()!.split(separator: " ").map{ Int($0)! }
var maxRes = -1000000000
var minRes = 1000000000

func dfs(input: [Int], n: Int, currIdx: Int, operands: [Int], sum: Int) {
    if currIdx == n {
        maxRes = max(maxRes, sum)
        minRes = min(minRes, sum)
        return
    }
    
    if operands[0] > 0 {
        let sum = sum + input[currIdx]
        dfs(input: input, n: n, currIdx: currIdx + 1, operands: [operands[0] - 1] + operands[1...], sum: sum)
    }
    if operands[1] > 0 {
        let sum = sum - input[currIdx]
        dfs(input: input, n: n, currIdx: currIdx + 1, operands: [operands[0]] + [operands[1] - 1] + operands[2...], sum: sum)
    }
    if operands[2] > 0 {
        let sum = sum * input[currIdx]
        dfs(input: input, n: n, currIdx: currIdx + 1, operands: Array(operands[...1]) + [operands[2] - 1] + [operands[3]], sum: sum)
    }
    if operands[3] > 0 {
        let sum = sum / input[currIdx]
        dfs(input: input, n: n, currIdx: currIdx + 1, operands: operands[0...2] + [operands[3] - 1], sum: sum)
    }
}

let sum = input.removeFirst()
dfs(input: input, n: n - 1, currIdx: 0, operands: operands, sum: sum)
print(maxRes)
print(minRes)