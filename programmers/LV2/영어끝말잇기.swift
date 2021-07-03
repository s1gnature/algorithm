import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var cacheArr = [words[0]] 
    for idx in 1..<words.count {
        if cacheArr.contains(words[idx]) {
            return [(idx % n) + 1, (idx / n) + 1]
        }else if words[idx-1].suffix(1) != words[idx].prefix(1) {
            return [(idx % n) + 1, (idx / n) + 1]
        }else { cacheArr.append(words[idx]) }
    }
    return [0, 0]
}

let tc1_n = 3
let tc1_words = ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]

let tc2_n = 5
let tc2_words = ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]

print(solution(tc2_n, tc2_words))