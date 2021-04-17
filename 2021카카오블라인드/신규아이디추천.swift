import Foundation

var new_id = "abcdefghijklmn.p"
var tmp_id = ""
new_id = new_id.lowercased() // 1

for chr in new_id { // 2
    // 이것도 for 문이 아니라 forEach로 다뤄볼 수 있지 않을까?
    if (chr >= "a" && chr <= "z") || (chr >= "0" && chr <= "9") || (chr == "-" || chr == "_" || chr == ".") { tmp_id += String(chr) }
}

while tmp_id.contains(".."){ // 3
    tmp_id = tmp_id.replacingOccurrences(of: "..", with: ".")
}
new_id = tmp_id

/*
 String.first, String.last 가 String.hasPrefix, String.hasSuffix 보다 성능이 월등히 좋음.
 아마도 has 같은 경우에는 string이 파라미터라 여러 케이스 들을 비교해야해서 성능이 느린듯 하다.
 
 또 removeFirst, removeLast랑 index를 직접 찾아서 배열을 재구성 하는거랑 비교해보면 index를 찾아서 배열을 자르는게 훨씬 빠르더라..
 remove 같은 경우엔 O(n) 이라는데 그래서 성능이 더 안 좋은 듯.
 
 if new_id.hasPrefix(".") { new_id.removeFirst() } // 4, 더 간결한 코드
 if new_id.hasSuffix(".") { new_id.removeLast() }
 
 if new_id.first == "." { new_id = String(new_id[new_id.index(after: new_id.startIndex)...]) } // 4
 if new_id.last == "." { new_id = String(new_id[..<new_id.index(before: new_id.endIndex)]) } // endIndex는 문자열 마지막 문자의 다음 끝을 참조
*/


if new_id.first == "." { new_id = String(new_id[new_id.index(after: new_id.startIndex)...]) } // 4
if new_id.last == "." { new_id = String(new_id[..<new_id.index(before: new_id.endIndex)]) }

if new_id == "" {new_id = "a"} // 5

if new_id.count >= 16 { // 6
    new_id = String(new_id[...new_id.index(new_id.startIndex, offsetBy: 14)])
    if new_id.hasSuffix(".") { new_id.removeLast() }
}

while new_id.count < 3 { // 7
    new_id += String(new_id.last!)
}
print(new_id)
