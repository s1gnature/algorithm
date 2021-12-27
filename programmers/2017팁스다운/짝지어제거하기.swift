import Foundation

func solution(_ s:String) -> Int{
    var stack = [Character]()
    s.forEach {
        if stack.last == $0 { stack.popLast() }
        else { stack.append($0) }
    }
    return stack.isEmpty ? 1 : 0
}

print(solution("baabaa"))