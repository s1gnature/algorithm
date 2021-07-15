func solution(_ n:Int) -> Int {
    if n == 0 { return 0 }
    else if n == 1 { return 1 }
    var prevResult = 0
    var currResult = 1
    for _ in 2...n {
        let result = (currResult + prevResult) % 1234567
        prevResult = currResult
        currResult = result
        
    }
    return currResult
}

print(solution(5))

