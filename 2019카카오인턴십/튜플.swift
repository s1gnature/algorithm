import Foundation

func solution(_ s:String) -> [Int] {
    var res = [Int]()
    s.components(separatedBy: ["{","}"])
        .filter({ $0 != "" })
        .sorted(by: { $0.count < $1.count })
        .forEach {
            $0.split(separator: ",")
                .forEach { if !res.contains(Int(String($0))!) { res.append(Int(String($0))!) }
            }
        }

    return res
}

print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
