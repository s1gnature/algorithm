// [6603번] 로또
import Foundation

while true {
    var input = readLine()!.split(separator: " ").map { String($0) }
    if Int(input.removeFirst())! == 0 { break }
    dfs(input, 0, [String]())
    print()
}
func dfs(_ input: [String], _ currIdx: Int, _ res: [String]) {
    if res.count == 0 && (currIdx > input.count-6) {
        return
    }
    if res.count == 6 {
        print(res.joined(separator: " "))
        return
    }
    
    (currIdx..<input.count).forEach {
        dfs(input, $0+1, res + [input[$0]])
    }
}