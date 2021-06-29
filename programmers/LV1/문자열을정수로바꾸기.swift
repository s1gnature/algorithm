import Foundation

func solution(_ s:String) -> Int {
    if s.first == "-" {
        return -Int(String(s[s.index(s.startIndex, offsetBy: 1)...]))!
    }else{
        return Int(s)!
    }
}