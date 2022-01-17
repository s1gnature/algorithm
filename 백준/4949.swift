import Foundation

while let input = readLine() {
    if input == "." { break }
    isBalance(input) ? print("yes") : print("no")
}

func isBalance(_ s: String) -> Bool {
    var stack = [Character]()
    for chr in s {
        if chr == "(" || chr == "[" {
            stack.append(chr)
        } else if chr == ")" || chr == "]" {
            guard let lastChr = stack.popLast() else { return false }
            if (lastChr == "(" && chr == "]") || (lastChr == "[" && chr == ")") { return false }
        }
    }
    if stack.isEmpty { return true }
    else { return false }
}