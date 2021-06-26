func solution(_ n:Int) -> Int
{
    var resultSum = 0
    String(n).forEach() { num in
        resultSum += Int(String(num))!
    }
    return resultSum
}