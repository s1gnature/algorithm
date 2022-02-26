// [1992번] 쿼드트리
let n = Int(readLine()!)!
var input = [[Int]]()
var res = ""
(0..<n).forEach { _ in input.append(readLine()!.map{ Int(String($0))! }) }
quadTree(input, x: 0, y: 0, len: n)
print(res)
func quadTree(_ input: [[Int]], x: Int, y: Int, len: Int) {
    var newInput = [[Int]]()
    input[y..<y+len].forEach { newInput.append(Array($0[x..<x+len])) }
    
    switch zipChecker(input: newInput) {
    case 0: res += "0"
    case 1: res += "1"
    case -1:
        res += "("
        // QT1
        quadTree(input, x: x, y: y, len: len / 2)
        // QT2
        quadTree(input, x: x + len / 2, y: y, len: len / 2)
        // QT3
        quadTree(input, x: x, y: y + len / 2, len: len / 2)
        // QT4
        quadTree(input, x: x + len / 2, y: y + len / 2, len: len / 2)
        res += ")"
    default: break
    }
}

func zipChecker(input: [[Int]]) -> Int {
    if input.count == 1 { return input.first!.first! }
    var zeroCnt = 0
    var oneCnt = 0
    for outer in input {
        for inner in outer {
            if (inner == 1 && zeroCnt != 0) || (inner == 0 && oneCnt != 0) { return -1 }
            else {
                if inner == 0 { zeroCnt += 1 }
                else if inner == 1 { oneCnt += 1 }
            }
        }
    }
    return zeroCnt > 0 ? 0 : 1
}