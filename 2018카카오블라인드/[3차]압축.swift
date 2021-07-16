func solution(_ msg:String) -> [Int] {
    var msg = msg
    var dic: Dictionary<String, Int> = [
        "A" : 1, "B" : 2, "C" : 3, "D" : 4, "E" : 5,
        "F" : 6, "G" : 7,"H" : 8, "I" : 9, "J" : 10,
        "K" : 11, "L" : 12, "M" : 13, "N" : 14, "O" : 15,
        "P" : 16, "Q" : 17, "R" : 18, "S" : 19, "T" : 20,
        "U" : 21, "V" : 22, "W" : 23, "X" : 24, "Y" : 25, "Z" : 26
    ]

    var idxArr = [Int]()
    var cnt = 1
    while msg.count != 0 {
        var currInput = String(msg.prefix(cnt))
        if dic.contains(where: { $0.key == currInput }) {
            if cnt > currInput.count {
                idxArr.append(dic[currInput]!)
                break
            }
            cnt += 1
        }else {
            dic[currInput] = dic.count + 1
            idxArr.append(dic[String(currInput.prefix(currInput.count - 1))]!)
            msg = String(msg.suffix(msg.count - currInput.count + 1))
            cnt = 1
        }
    }
    return idxArr
}

let tc1 = "KAKAO"
let tc2 = "TOBEORNOTTOBEORTOBEORNOT"
let tc3 = "ABABABABABABABAB"
print(solution(tc2))
