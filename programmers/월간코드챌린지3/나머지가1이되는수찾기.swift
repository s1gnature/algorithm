import Foundation

func solution(_ n:Int) -> Int {
    var devider = 2
    while(n % devider != 1) {
        devider += 1
    }
    return devider
}

print(solution(10))