import Foundation

func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var scoreDic = Dictionary<String, Int>()
    
    var partTable = [[String]]()
    table.forEach() {
        partTable.append($0.components(separatedBy: " "))
    }   
    for p_idx in 0..<partTable.count {
        var score = 0
        for l_idx in 0..<languages.count {
            if let matchIdx = partTable[p_idx].firstIndex(of: languages[l_idx]) {
                score += abs(matchIdx-6) * preference[l_idx]
            }
        }
        scoreDic[partTable[p_idx][0]] = score
    }
    
    let maxScore = scoreDic.values.max()
    return scoreDic.filter(){$0.value == maxScore}.sorted(by: <).first!.key
}

let tc1_table = ["SI JAVA JAVASCRIPT SQL PYTHON C#", "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++", "HARDWARE C C++ PYTHON JAVA JAVASCRIPT", "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP", "GAME C++ C# JAVASCRIPT C JAVA"]
let tc1_languages = ["PYTHON", "C++", "SQL"]
let tc1_preference = [7,5,5]

let tc2_table = ["SI JAVA JAVASCRIPT SQL PYTHON C#", "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++", "HARDWARE C C++ PYTHON JAVA JAVASCRIPT", "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP", "GAME C++ C# JAVASCRIPT C JAVA"]
let tc2_languages = ["JAVA", "JAVASCRIPT"]
let tc2_preference = [7,5]

print(solution(tc1_table, tc1_languages, tc1_preference))
print(solution(tc2_table, tc2_languages, tc2_preference))