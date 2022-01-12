let n = Int(readLine()!)!
var factorialDpDic = Dictionary<Int, Int>()
var combinationDpDic = Dictionary<[Int], Int>()

for _ in 0..<n {
    let tc = readLine()!.split(separator: " ").map{ Int($0)! }
    print(combination(n: tc[1], r: tc[0]))
}

func combination(n: Int, r: Int) -> Int {
    if n == r || r == 0 { return 1 }
    else {
        let key = [n, r]
        if let result = combinationDpDic[key] { return result }
        else {
            combinationDpDic[key] = combination(n: n-1, r: r-1) + combination(n: n-1, r: r)
            return combinationDpDic[key]!
        }
    }
}

func factorial(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    else if n == 2 { return 2 }
    else {
        if let result = factorialDpDic[n] { return result }
        else {
            factorialDpDic[n] = n * factorial(n-1)
            return factorialDpDic[n]!
        }
    }
}