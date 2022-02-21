// [5545번] 최고의 피자
import Foundation

let t_kind = Int(readLine()!)!
let price = readLine()!.split(separator: " ").map{ Int($0)! }
let d_cal = Int(readLine()!)!
var t_cal = [Int]()
(0..<t_kind).forEach { _ in t_cal.append(Int(readLine()!)!) }
var dfs_cache = Array(repeating: false, count: t_kind)
var calSum = d_cal
var priceSum = price[0]
var res = Int(floor(Double(calSum) / Double(priceSum)))

for cal in t_cal.sorted(by: >) {
    let toppedCal = Int(floor(Double(calSum + cal) / Double(priceSum + price[1])))
    if res <= toppedCal {
        calSum += cal
        priceSum += price[1]
        res = toppedCal
    } else { break }
}
print(res)