import Foundation

func solution(_ phone_number:String) -> String {
    var result = ""
    var endNumber = String(phone_number[phone_number.index(phone_number.endIndex, offsetBy: -4)...])
    for _ in 0..<phone_number.count-4 {
        result += "*"
    }
    return result + endNumber
}

print(solution("027778888"))