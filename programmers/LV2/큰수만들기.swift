import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var count = 0
    var lastIndex = 0
    var stack = [Character]()
    
    for (idx, value) in number.enumerated() {
        if stack.isEmpty {
            stack.append(value)
            continue
        }
        
        while true {
            guard let stackValue = stack.last else { break }
            if stackValue < value {
                stack.popLast()
                count += 1
                if count == k { break }
            } else { break }
        }
        
        stack.append(value)
        if count == k {
            lastIndex = idx + 1
            break
        }
    }
    
    let last = String(number[number.index(number.startIndex, offsetBy: lastIndex)..<number.index(number.startIndex, offsetBy: number.count - (k - count))])

    if count == 0 { return last }
    return stack.reduce("", { $0 + String($1) }) + last
}