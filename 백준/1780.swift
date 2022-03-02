// [1780번] 종이의 개수
let n = Int(readLine()!)!
var input = [[Int]]()
var res = [0, 0, 0]
(0..<n).forEach { _ in input.append(readLine()!.split(separator: " ").map{ Int(String($0))! }) }

func counter(input: [[Int]], x: Int, y: Int, len: Int) {
    if let result = classifier(input: input) {
        res[result+1] += 1
    } else if len == 3 {
        input.forEach {
            $0.forEach {
                res[$0+1] += 1
            }
        }
    } else {
        (0..<3).forEach { y in
            (0..<3).forEach { x in
                let newL = len/3
                let newX = x*newL
                let newY = y*newL
                var newInput = [[Int]]()
                input[newY..<newY+newL].forEach { newInput.append(Array($0[newX..<newX+newL])) }
                counter(input: newInput, x: newX, y: newY, len: newL)
            }
        }
    }
}
func classifier(input: [[Int]]) -> Int? {
    let pivot = input.first!.first!
    if input.count == 1 { return pivot }
    for outer in input {
        for inner in outer {
            if pivot != inner { return nil }
        }
    }
    return pivot
}
counter(input: input, x: 0, y: 0, len: n)
res.forEach{ print($0) }