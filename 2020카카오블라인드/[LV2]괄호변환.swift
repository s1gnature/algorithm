import Foundation

func solution(_ p:String) -> String {
    var resultString = ""
    if p == "" { return "" } // 1.
    else if isCorrectString(p) { return p }

    var separateArr = getBalancedStringArr(p) // 2.
    if isCorrectString(separateArr[0]) { // 3.
        return separateArr[0] + solution(separateArr[1])
    }
    
    // 4.
    var newV = "(" + solution(separateArr[1]) + ")"
    var newU = getReversedString(separateArr[0])

    return newV + newU
}

func getBalancedStringArr(_ value: String) -> [String] {
    for cnt in 1...value.count {
        let subStringValue = value.prefix(cnt)
        if subStringValue.filter({ $0 == "(" }).count == subStringValue.filter({ $0 == ")" }).count {
            return [String(subStringValue), String(value.suffix(value.count - cnt))]
        }
    }
    return [String]()
}

func isCorrectString(_ value: String) -> Bool {
    if value == "" { return true }
    var value = value
    var queue = String(value.removeFirst())
    if queue == ")" { return false }
    for chr in value {
        var chr = String(chr)
        if chr == "(" { queue.append(chr) }
        else {
            if queue.popLast() == nil { return false }
        }
    }
    return queue.isEmpty
}

// 4-4
func getReversedString(_ value: String) -> String {
    var newString = ""
    var tmp = value.prefix(value.count - 1)
    tmp = tmp.suffix(tmp.count - 1)

    tmp.forEach {
        if String($0) == "(" { newString += ")" }
        else { newString += "(" }
    }
    return newString
}
print(solution("()))((()"))
