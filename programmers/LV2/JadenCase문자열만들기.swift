import Foundation

func solution(_ s:String) -> String {
    var resultStr = ""
    s.forEach {
        let chr = String($0)
        if chr == " " { resultStr += chr }
        else {
            if resultStr.count == 0 {
                if $0.isLetter { resultStr += String(chr.uppercased()) }
                else { resultStr += chr }
            }else {
                if String(resultStr.last!) == " " {
                    if $0.isLetter { resultStr += String(chr.uppercased()) }
                    else { resultStr += chr }
                }else {
                    resultStr += String(chr.lowercased())
                }
            }
        }
    }
    return resultStr
}

let tc1 = "3people unFollowed me"
let tc2 = "for the last week"
print(solution(tc1) == "3people Unfollowed Me")