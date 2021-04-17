import Foundation

func calc(oper: String, a: Int, b: Int) -> Int {
    switch oper {
    case "+": return a + b
    case "-": return a - b
    case "*": return a * b
    default:
        return -1
    }
}

let operatorPriority = [["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"], ["-", "*", "+"], ["*", "-", "+"], ["*", "+", "-"]]
var expression = "100-200*300-500+2"
var result = 0

for priority in operatorPriority {
    var calcArr = [String]()
    var numArr = expression.components(separatedBy: ["-", "+", "*"]).map({ Int($0)! })
    
    var operatorArr = [String]()
    expression.forEach {
        if !$0.isNumber { operatorArr.append(String($0))}
    }
    
    for oper in priority {
        while let idx = operatorArr.index(of: oper) {
            let aIdx = numArr.index(idx, offsetBy: 0)
            let bIdx = numArr.index(idx, offsetBy: 1)
            
            let calcValue = calc(oper: oper, a: numArr.remove(at: idx), b: numArr.remove(at: idx))
            operatorArr.remove(at: idx)
            numArr.insert(calcValue, at: idx)
        }
    }
    if result < abs(numArr[0]) { result = abs(numArr[0]) }
}

print(result)