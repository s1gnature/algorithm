import Foundation

let n = Int(readLine()!)!
var input = [Int]()
(0..<n).forEach { _ in input.append(Int(readLine()!)!) }
print(quicksort(input))

func quicksort(_ input: [Int]) -> [Int] {
    if input.count < 2 { return input }
    let pivot = input[input.count/2]
    var under = [Int]()
    var over = [Int]()
    var equal = [Int]()
    input.forEach {
        if $0 < pivot { under.append($0) }
        else if $0 > pivot { over.append($0) }
        else { equal.append($0) }
    }
    return quicksort(under) + equal + quicksort(over)
}