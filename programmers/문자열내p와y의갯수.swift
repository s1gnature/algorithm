func solution(_ s:String) -> Bool
{
    var s = s.lowercased()
    return s.components(separatedBy: "p").count == s.components(separatedBy: "y").count
}