import Foundation

func solution(_ arr:[Int]) -> [Int] {
    if arr.count == 1 { return [-1] }
    else{
        var arr = arr
        arr.remove(at: arr.index(of: arr.min()!)!)
        return arr
    }
}

print(solution([4,3,2,1]))