import Foundation

func solution(_ numbers:[Int]) -> String {
    var r = numbers.reduce(""){ $0 + String($1) }.count
    var firstValueOfResult = numbers.map {
        String(String($0).first!)
    }.max()!
    var checkList = Array(repeating: 0, count: numbers.count)
    var resultString = ""
    var maxValue = "0"

    func permutationDFS(depth: Int = 0, tmpString: String = "", r: Int) {
        if resultString.count == r { // complete permutation
            if maxValue < resultString { maxValue = resultString }
        }else {
            for i in 0..<checkList.count {
                if checkList[i] == 0 {
                    if depth == 0 && (String(String(numbers[i]).first!) != firstValueOfResult) {
                        continue
                    }
                    checkList[i] = 1
                    resultString.append(String(numbers[i]))
                    permutationDFS(depth: depth+1, tmpString: resultString, r: r)
                    checkList[i] = 0
                    resultString = tmpString
                }
            }
        }
    }

    permutationDFS(r: r)
    return String(Int(maxValue)!)
}

print(solution([21,212]))
