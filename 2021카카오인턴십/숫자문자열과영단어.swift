import Foundation

func solution(_ s:String) -> Int {
    var result = ""
    var tmp = ""
    let numStr = [
        "zero" : 0,
        "one" : 1,
        "two" : 2,
        "three" : 3,
        "four" : 4,
        "five" : 5,
        "six" : 6,
        "seven" : 7,
        "eight" : 8,
        "nine" : 9
    ]
    s.forEach({
        if numStr.contains(where: {$0.key == tmp}) {
            result += String(numStr[tmp]!)
            tmp = ""
        }
        if $0.isNumber { result += String($0) }
        else { tmp += String($0) }
    })
    if !tmp.isEmpty { result += String(numStr[tmp]!) }
    return Int(result)!
}