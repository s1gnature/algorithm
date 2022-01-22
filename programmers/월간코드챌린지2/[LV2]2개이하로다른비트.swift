import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var res = [Int64]()
    
    numbers.forEach { num in
        if num % 2 == 0 { res.append(Int64(num + 1)) }
        else {
            var binaryString = "0" + String(num, radix: 2)
            for value in 1...binaryString.count {
                let idx = binaryString.index(binaryString.startIndex, offsetBy: binaryString.count - value)
                if binaryString[idx] == "0" {
                    binaryString.remove(at: idx)
                    binaryString.remove(at: idx)
                    binaryString.insert(contentsOf: "10", at: idx)
                    res.append(Int64(binaryString, radix: 2)!)
                    break
                }
            }
        }
    }
    return res
}