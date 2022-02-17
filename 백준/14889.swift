// [14889번] 스타트와 링크
var res = 200
let n = Int(readLine()!)!
var statBoard = [[Int]]()

(0..<n).forEach { _ in statBoard.append(readLine()!.split(separator: " ").map{ Int($0)! }) }

func dfs(_ currIdx: Int, _ team: [Int], _ target: Int) {
    if team.count == target {
        let teamLink: [Int] = {
            var teamLink = Array(0..<n)
            for idx in 1...team.count {
                let reversedIdx = team.count - idx
                teamLink.remove(at: team[reversedIdx])
            }
            return teamLink
        }()
        let startTeamStat = getTeamStat(team)
        let linkTeamStat = getTeamStat(teamLink)
        res = min(res, abs(linkTeamStat - startTeamStat))
        return
    }
    
    (currIdx..<n).forEach{dfs($0+1, team+[$0], target)}
}

func getTeamStat(_ team: [Int]) -> Int {
    var teamStat = 0
    for pivot in 0..<team.count-1 {
        for target in pivot..<team.count {
            teamStat += (statBoard[team[pivot]][team[target]] + statBoard[team[target]][team[pivot]])
        }
    }
    return teamStat
}

dfs(0, [], n/2)
print(res)