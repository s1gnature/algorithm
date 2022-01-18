import Foundation

var square = [[Int]]()
let n = Int(readLine()!)!
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    square.append(input)
}

let squareCount = splitSquare(square: square, n: n)
print("\(squareCount[0])\n\(squareCount[1])")

func splitSquare(square: [[Int]], n: Int) -> [Int] {
    var square = square
    var whiteCount = 0
    var blueCount = 0
    
    if square.count == 1 {
        if square[0][0] == 1 { return [0, 1] }
        else { return [1, 0] }
    }
    
    if checkColoredSquare(square) {
        if isAllWhite(square) { return [1, 0] }
        // TODO: 쪼개기
        for quarter in 0..<4 { // 가로세로 중앙 절취
            var splitedSquare = [[Int]]()
            for column in 0..<n/2 {
                var tmp = [Int]()
                for _ in 0..<n/2 {
                    tmp.append(square[column].removeFirst())
                }
                splitedSquare.append(tmp)
            }
            if quarter == 1 {
                for _ in 0..<n/2 {
                    square.removeFirst()
                }
            }
            if !isAllWhite(splitedSquare) {
                let counts = splitSquare(square: splitedSquare, n: n/2)
                whiteCount += counts[0]
                blueCount += counts[1]
            } else {
                whiteCount += 1
            }
        }
    } else {
        blueCount += 1
    }
    
    return [whiteCount, blueCount]
}

func checkColoredSquare(_ square: [[Int]]) -> Bool {
    for line in square {
        if line.contains(0) { return true }
    }
    return false
}

func isAllWhite(_ square: [[Int]]) -> Bool {
    for line in square {
        if line.contains(1) { return false }
    }
    return true
}