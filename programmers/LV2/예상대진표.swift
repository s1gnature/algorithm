import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var a = a
    var b = b
    var answer = 1

    while(true) {
        if (max(a, b) % 2 == 0) && (abs(a-b) == 1) {
            return answer
        } 
        if a % 2 != 0  && a != 1{ a += 1 }
        if b % 2 != 0 && b != 1{ b += 1 }
        
        if a != 1 { a /= 2 }
        if b != 1 { b /= 2 }
        answer += 1
    }
    // return answer
}

print(solution(8, 4, 5))