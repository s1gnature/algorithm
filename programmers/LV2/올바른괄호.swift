import Foundation

func solution(_ s:String) -> Bool {
    var stack = [Character]()
    
    for chr in s {
        if chr == "(" { stack.append(chr) }
        else {
            if stack.isEmpty { return false }
            else { stack.popLast() }
        }
    }
    
    return stack.isEmpty
}