import Foundation

let tc1_arr = [5, 9, 7, 10]
let tc1_divisor = 5
// return = 5, 10
let tc2_arr = [2, 36, 1, 3]
let tc2_divisor = 1
// return 1,2,3,36
let tc3_arr = [3,2,6]
let tc3_divisor = 10

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var resultArr = arr.filter{ return $0 % divisor == 0 }.sorted()
    return resultArr.isEmpty ? [-1] : resultArr
}

print(solution(tc2_arr, tc2_divisor))
