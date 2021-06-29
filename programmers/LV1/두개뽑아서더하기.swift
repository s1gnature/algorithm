import Foundation

let tc1 = [2,1,3,4,1]
let tc2 = [5,0,2,7]

func solution(_ numbers:[Int]) -> [Int] {
    var resultSet = [Int]()
    numbers.indices.forEach {
        for idx in $0+1..<numbers.count {
            resultSet.append(numbers[$0] + numbers[idx])
        }
    }
    return Set(resultSet).sorted()
}

print(solution(tc2))
