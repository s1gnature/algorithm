import Foundation

func binarySearch(_ input: [Int], _ target: Int, _ min: Int, _ max: Int) -> Int {
    var min = min
    var max = max
    var res = 0
    while min < max {
        let mid = (min + max) / 2
        var sum = 0
        input.forEach { if $0 > mid { sum += $0 - mid } }
        if target <= sum {
            res = mid
            min = mid + 1
        } else {
            max = mid
        }
    }
    return res
}
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
print(binarySearch(input, nm[1], 0, input.max()!))