import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let monthArr = [31,29,31,30,31,30,31,31,30,31,30,31]
    let weekArr = ["THU","FRI","SAT","SUN","MON","TUE","WED"]
    var daySum = monthArr[0..<a-1].reduce(0, +) + b

    return weekArr[daySum % 7]
}

print(solution(5, 24))


