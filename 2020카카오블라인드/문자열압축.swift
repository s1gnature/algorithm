import Foundation

var s = "a"
var minLen = s.count
if minLen == 1 { print(minLen) }
for len in 1...s.count/2 { // 압축 길이는 전체 길이의 절반을 넘을 수 없음
    var compressedString = ""
    var compressWord = s[s.startIndex..<s.index(s.startIndex, offsetBy: len)]
    var compressCnt = 1
    var lastWord = ""
    var word = Substring()
    for idx in stride(from: len, to: s.count-len+1, by: len) {
        word = s[s.index(s.startIndex, offsetBy: idx)..<s.index(s.startIndex, offsetBy: idx+len)]
        lastWord = String(s[s.index(s.startIndex, offsetBy: idx+len)...])
        if compressWord == word { compressCnt += 1 }
        else {
            if compressCnt == 1 { compressedString += compressWord }
            else { compressedString += (String(compressCnt) + compressWord) }
            compressWord = word
            compressCnt = 1
        }
    }
    
    if compressCnt == 1 { compressedString += compressWord }
    else { compressedString += (String(compressCnt) + compressWord) }
    compressWord = word
    compressCnt = 1

    compressedString += lastWord
    
    var compressedStringCnt = compressedString.count
    if minLen > compressedStringCnt { minLen = compressedStringCnt }
}
print(minLen)

