import Foundation

func solution(_ s:String) -> String {
    var resultString = ""
    var arr = s.components(separatedBy: " ")
    for word in arr {
        for idx in 0..<word.count {
            if idx % 2 == 0 { resultString.append(word[word.index(word.startIndex, offsetBy: idx)].uppercased()) }
            else { resultString.append(word[word.index(word.startIndex, offsetBy: idx)].lowercased())}
        }
        resultString.append(" ")
    }
    resultString.removeLast()
    return resultString
}