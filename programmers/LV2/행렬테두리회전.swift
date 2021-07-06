import Foundation

// tc1_reuslt = [8, 10, 25]
let tc1_rows = 6
let tc1_columns = 6
let tc1_queries = [[2,2,5,4],[3,3,6,6],[5,1,6,3]]

// tc2_result = [1, 1, 5, 3]
let tc2_rows = 3
let tc2_columns = 3
let tc2_queries = [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]]

// tc3_result = [1]
let tc3_rows = 100
let tc3_columns = 97
let tc3_queries = [[1,1,100,97]]

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var resultArr = [Int]()
    // init
    var matrix = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var cnt = 1
    matrix.forEach.
    for yIdx in 0..<rows {
        for xIdx in 0..<columns {
            matrix[yIdx][xIdx] = cnt
            cnt += 1
        }
    }

    // rotate and get min value of Rect
    queries.forEach {
        resultArr.append(rotateRectAndGetMin($0, &matrix))
        //print(matrix)
    }
    return resultArr
}

func rotateRectAndGetMin(_ query: [Int], _ matrix: inout [[Int]]) -> Int {
    let xStartIdx = query[1]-1
    let xEndIdx = query[3]-1
    let yStartIdx = query[0]-1
    let yEndIdx = query[2]-1
    // get query's rect matrix
    var rectMatrix = Array(repeating: Array(repeating: 0, count: xEndIdx-xStartIdx+1), count: yEndIdx-yStartIdx+1)
    for yIdx in 0..<yEndIdx-yStartIdx+1 {
        for xIdx in 0..<xEndIdx-xStartIdx+1 {
            rectMatrix[yIdx][xIdx] = matrix[yIdx + yStartIdx][xIdx + xStartIdx]
        }
    }

    var min = rectMatrix[0][0]
    // move upSide & downSide
    // x축을 한칸씩 미는데, 칸을 그대로 밀고 비게된 자리는 무시한다. y축 밀때 넣어지므로.
    for xIdx in 0..<xEndIdx-xStartIdx {
        if min > rectMatrix[0][xIdx] { min = rectMatrix[0][xIdx] }
        if min > rectMatrix[yEndIdx-yStartIdx][xEndIdx-xStartIdx-xIdx] { min = rectMatrix[yEndIdx-yStartIdx][xEndIdx-xStartIdx-xIdx] }
        matrix[yStartIdx][xStartIdx+xIdx+1] = rectMatrix[0][xIdx] // upSide
        matrix[yEndIdx][xEndIdx-xIdx-1] = rectMatrix[yEndIdx-yStartIdx][xEndIdx-xStartIdx-xIdx] // downSide
    }
    // move leftSide & rightSide
    for yIdx in 0..<yEndIdx-yStartIdx {
        if min > rectMatrix[yIdx][xEndIdx-xStartIdx] { min = rectMatrix[yIdx][xEndIdx-xStartIdx] }
        if min > rectMatrix[yEndIdx-yStartIdx-yIdx][0] { min = rectMatrix[yEndIdx-yStartIdx-yIdx][0] }
        matrix[yStartIdx+yIdx+1][xEndIdx] = rectMatrix[yIdx][xEndIdx-xStartIdx] // rightSide
        matrix[yEndIdx-yIdx-1][xStartIdx] = rectMatrix[yEndIdx-yStartIdx-yIdx][0] // leftSide
    }

    return min
}
print(solution(tc2_rows, tc2_columns, tc2_queries))
