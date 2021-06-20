import Foundation

var dict = Dictionary<String, [Int]>()
var info = ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]
var query = ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]
var result = [Int]()

for iValue in info {
    let tokenizedArr = iValue.components(separatedBy: [" "])
    let languageKey = [tokenizedArr[0], "-"]
    let partKey = [tokenizedArr[1], "-"]
    let careerKey = [tokenizedArr[2], "-"]
    let soulFoodKey = [tokenizedArr[3], "-"]
    let value = Int(tokenizedArr[4])!
    
    for language in languageKey {
        for part in partKey {
            for career in careerKey {
                for soulFood in soulFoodKey {
                    let key = language + part + career + soulFood
                    if dict[key] == nil { dict[key] = [value] }
                    else { dict[key]!.append(value) }
                }
            }
        }
    }
}
for element in dict {
    let sortValue = element.value.sorted(by: >)
    dict[element.key] = sortValue
}

for qValue in query {
    let tokenizedArr = qValue.components(separatedBy: [" "])
    let key = tokenizedArr[0] + tokenizedArr[2] + tokenizedArr[4] + tokenizedArr[6]
    var cnt = 0
    
    if let value = dict[key] {
        
        for score in value {
            if score >= Int(tokenizedArr[7])! { cnt += 1 }
            else { break }
        }
    }
    result.append(cnt)
}
print(result)
/*  https://velog.io/@sainkr/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EC%88%9C%EC%9C%84-%EA%B2%80%EC%83%89-Swift
*/
