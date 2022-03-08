// [6549번] 히스토그램에서 가장 큰 직사각형
while let input = readLine()?.split(separator: " ").map{ Int($0)! } {
    if input[0] == 0 { break }

    var res = 0
    getSize(Array(input[1...]), 0, input.count - 2, &res)
    print(res)
}
func getSize(_ input: [Int], _ startIdx: Int, _ endIdx: Int, _ res: inout Int) {
    let len = endIdx - startIdx + 1
    if len == 1 {
        res = max(res, input[0])
        return
    } else if len == 2 {
        res = max(res, max(input[startIdx], input[endIdx]))
        res = max(res, min(input[startIdx], input[endIdx]) * 2)
        return
    }
    let startIdx = startIdx
    let endIdx = endIdx
    let mid = (startIdx + endIdx) / 2
    res = max(res, max(input[startIdx...mid].min()!, input[mid...endIdx].min()!) * len / 2)
    res = max(res, mergedSize(input, startIdx, mid, endIdx))
    getSize(input, startIdx, mid, &res)
    getSize(input, mid, endIdx, &res)
}
func mergedSize(_ input: [Int], _ startIdx: Int, _ mid: Int, _ endIdx: Int) -> Int {
    if endIdx - startIdx == 2 { return min(input[startIdx], input[endIdx]) * 2 }
    var res = input[mid]
    var maxHeight = input[mid]
    var leftVector = mid
    var rightVector = mid
    while leftVector > startIdx && rightVector < endIdx {
        if input[leftVector - 1] < input[rightVector + 1] {
            rightVector += 1
            maxHeight = min(maxHeight, input[rightVector])
        } else {
            leftVector -= 1
            maxHeight = min(maxHeight, input[leftVector])
        }
        res = max(res, (rightVector - leftVector + 1) * maxHeight)
    }
    if leftVector > startIdx {
        (startIdx..<leftVector).reversed().forEach {
            maxHeight = min(maxHeight, input[$0])
            res = max(res, (rightVector - $0 + 1) * maxHeight)
        }
    } else if rightVector < endIdx {
        (rightVector+1...endIdx).forEach {
            maxHeight = min(maxHeight, input[$0])
            res = max(res, ($0 - leftVector + 1) * maxHeight)
        }
    }
    return res
}