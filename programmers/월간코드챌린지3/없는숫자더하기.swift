import Foundation

func solution(_ numbers:[Int]) -> Int {
    let arr = [1,2,3,4,5,6,7,8,9,0]
    return arr.filter(){ !numbers.contains($0) }.reduce(0){ $0 + $1}
}

print(solution([1,2,3,4,6,7,8,0]))