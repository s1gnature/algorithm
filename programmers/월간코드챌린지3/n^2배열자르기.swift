import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var res = [Int]()
    
    (left...right).forEach {
        res.append(Int(max(($0 / Int64(n)), ($0 % Int64(n))) + 1))
    }

    return res
}


func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    return (left...right).map { Int(max(($0 / Int64(n)), ($0 % Int64(n))) + 1) }
}