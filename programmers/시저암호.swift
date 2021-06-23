func solution(_ s:String, _ n:Int) -> String {
    var resultString = ""
    s.forEach{ chr in
        if chr == " " {
            resultString.append(" ")
            return
        }
        
        var asciiValue = Int(chr.unicodeScalars.first!.value)
        var caesarValue = asciiValue + n
        if asciiValue >= 65 && asciiValue <= 90 {
            if caesarValue > 90 { caesarValue = 64 + caesarValue - 90 }
        }
        else if asciiValue >= 97 && asciiValue <= 122 {
            if caesarValue > 122 { caesarValue = 96 + caesarValue - 122 }
        }
        resultString.append(String(UnicodeScalar(caesarValue)!))
    }
    return resultString
}