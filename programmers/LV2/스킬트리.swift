import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var resultCnt = 0
    skill_trees.forEach {
        var skill = skill
        var flag = true
        for idx in 0..<$0.count {
            if skill.count == 0 { 
                break 
            }
            let currSkill = String($0[$0.index($0.startIndex, offsetBy: idx)])
            if skill.contains(currSkill) {
                if String(skill.first!) == currSkill {
                    skill.removeFirst()
                }else {
                    flag = false
                }
            }
        }
        if flag { resultCnt += 1 }
    }
    return resultCnt
}

print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
