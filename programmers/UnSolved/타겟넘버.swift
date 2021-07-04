import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let sum = numbers.reduce(0){ $0 + $1 }
    var resultCnt = 0

    var checkList = Array(repeating: 0, count: numbers.count)
    var resultString = ""

    func permutaionDFS(depth: Int, tmpString: String, r: Int) {
        if tmpString.count == r {
            let permuteValue = resultString.reduce(0) { $0 + Int(String($1))! }
            if sum - permuteValue*2 == target { resultCnt += 1 }
        }else {
            for i in 0..<numbers.count {
                if checkList[i] == 0 {
                    checkList[i] = 1
                    resultString.append(String(numbers[i]))
                    permutaionDFS(depth: depth+1, tmpString: resultString, r: r)
                    checkList[i] = 0
                    resultString = tmpString
                }
            }
        }
    }

    for cnt in 0..<numbers.count {
        permutaionDFS(depth: 0, tmpString: "", r: cnt)
    }
    return resultCnt
}

print(solution([1,1,1,1,1], 3))

