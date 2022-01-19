import Foundation

// Sol 1
func solution(_ s:String) -> Int {
    if s.count % 2 == 1 { return 0 }
    var s = s
    var res = 0

    for _ in 0..<s.count {
        var count = 0
        var stack = [Character]()
        for chr in s {
            if !isCloseChar(chr) {
                stack.append(chr)
            } else if stack.isEmpty && isCloseChar(chr) {
                res = max(count, res)
                break
            } else if !stack.isEmpty && isCloseChar(chr) {
                if isMatched(stack.last!, chr) {
                    stack.popLast()
                    if stack.isEmpty { count += 1 }
                } else {
                    res = max(count, res)
                    break
                }
            }
        }
        res = max(count, res)
        s.append(s.removeFirst())
    }
    
    return res
}

func isCloseChar(_ chr: Character) -> Bool {
    return (chr == ")" || chr == "}" || chr == "]")
}

func isMatched(_ lhs: Character, _ rhs: Character) -> Bool {
    return (lhs == "(" && rhs == ")") || (lhs == "[" && rhs == "]") || (lhs == "{" && rhs == "}")
}