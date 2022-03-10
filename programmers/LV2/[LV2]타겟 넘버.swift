import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let sum = numbers.reduce(0){ $0 + $1 }
    var res = 0
    
    func dfs(_ input: [Int], _ currIdx: Int, _ minusCnt: Int, _ currMinusCnt: Int, _ currSum: Int) {
        if currMinusCnt == minusCnt {
            if currSum == target { res += 1 }
            else { return }
        }
        
        (currIdx..<input.count).forEach {
            dfs(input, $0+1 , minusCnt, currMinusCnt+1, currSum - input[$0] * 2)
        }
    }
    
    (0..<numbers.count).forEach {
        dfs(numbers, 0, $0, 0, sum)
    }
    return res
}