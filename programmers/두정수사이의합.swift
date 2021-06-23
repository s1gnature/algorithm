func solution(_ a:Int, _ b:Int) -> Int64 {
    return a < b ? Int64(b*(b+1)/2 - a*(a-1)/2) : Int64(a*(a+1)/2 - b*(b-1)/2)
}