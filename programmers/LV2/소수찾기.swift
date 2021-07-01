import Foundation

func solution(_ numbers:String) -> Int {
    var numArr = numbers.map{ Int(String($0))! }
    var permutationArr = [Int]()
    var checkList = Array(repeating: 0, count: numArr.count)
    var permutatingString = ""
    
    func permutationDFS(depth: Int = 0, tmpString: String = "", r: Int) {
        if tmpString.count == r {
            if let resultValue = Int(tmpString){
                permutationArr.append(resultValue)
            }
        }else {
            for idx in 0..<numArr.count {
                if checkList[idx] == 0 {
                    checkList[idx] = 1
                    permutatingString.append(String(numArr[idx]))
                    permutationDFS(depth: depth+1, tmpString: permutatingString, r: r)
                    checkList[idx] = 0
                    permutatingString = tmpString
                }
            }
        }
    }
    
    func isPrime(value: Int) -> Bool {
        if value < 2 { return false }
        else if value == 2 || value == 3 { return true }
        for num in 2...Int(sqrt(Double(value))) {
            if value % num == 0 { return false }
        }
        return true
    }
    
    for r in 1...numArr.count {
        permutationDFS(r: r)
    }
    return Set(permutationArr).filter { isPrime(value: $0) }.count
}

print(solution("011"))
