import Foundation

func solution(_ record:[String]) -> [String] {
    var userDic = Dictionary<String, String>()
    var stack = [(String, String)]()
    var res = [String]()
    
    record.forEach {
        let query = $0.split(separator: " ")
        let state = String(query[0])
        let uid = String(query[1])
        if query.count == 2 {
            stack.append((uid, state))
            return
        }
        
        let userName = String(query[2])
        
        if state == "Change" {
            userDic[uid] = userName
            return
        }
        
        userDic[uid] = userName
        stack.append((uid, state))
    }
    
    stack.forEach {
        if $0.1 == "Enter" { res.append("\(userDic[$0.0]!)님이 들어왔습니다.") }
        else { res.append("\(userDic[$0.0]!)님이 나갔습니다.")}
    }
    
    return res
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))