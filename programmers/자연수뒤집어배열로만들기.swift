import Foundation

func solution(_ n:Int64) -> [Int] {
    var resultArr = [Int]()
    var value = String(n).reversed().forEach{ resultArr.append(Int(String($0))!)}
    return resultArr
}