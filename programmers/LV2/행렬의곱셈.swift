import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var resultArr = [[Int]]()

    for arr1row in arr1 {
        var matrixSum = [Int]()
        for arr2Idx in 0..<arr2.count {
            var sum = 0
            for rowIdx in 0..<arr1row.count {
                sum += arr1row[rowIdx] * arr2[rowIdx][arr2Idx]
            }
            matrixSum.append(sum)
        }
        resultArr.append(matrixSum)
    }
    return resultArr
}

let tc1_arr1 = [[1, 4], [3, 2], [4, 1]]
let tc1_arr2 = [[3, 3], [3, 3]]

let tc2_arr1 = [[2, 3, 2], [4, 2, 4], [3, 1, 4]]
let tc2_arr2 = [[5, 4, 3], [2, 4, 1], [3, 1, 1]]

print(solution([[1, 2, 3], [4, 5, 6]], [[1, 4], [2, 5], [3, 6]]))