import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var res = (0, "(None)")
    let m = convertMusic(m)
    for musicinfo in musicinfos {
        let input = musicinfo.split(separator: ",")
        let startTime = String(input[0])
        let endTime = String(input[1])
        let title = String(input[2])
        let code = convertMusic(String(input[3]))
        let duration = getDurationTime(from: startTime, to: endTime)
        
        if isMatch(m: m, code: code, duration: duration) && (res.0 < duration) { res = (duration, title) }
    }
    
    return res.1
}

func convertMusic(_ musicinfo: String) -> String {
    var new = ""
    for idx in 0..<musicinfo.count - 1 {
        let chr = String(musicinfo[musicinfo.index(musicinfo.startIndex, offsetBy: String.IndexDistance(idx))])
        if String(musicinfo[musicinfo.index(musicinfo.startIndex, offsetBy: String.IndexDistance(idx + 1))]) == "#" {
            switch chr {
            case "C": new += "1"
            case "D": new += "2"
            case "F": new += "3"
            case "G": new += "4"
            case "A": new += "5"
            default: break
            }
        } else if chr != "#" {
            new += chr
        }
    }
    return new + (String(musicinfo.last!) != "#" ? String(musicinfo.last!) : "")
}

func getDurationTime(from startTime: String, to endTime: String) -> Int {
    let startTime = startTime.split(separator: ":")
    let startHour = Int(startTime[0])!
    let startMin = Int(startTime[1])!
    let endTime = endTime.split(separator: ":")
    let endHour = Int(endTime[0])!
    let endMin = Int(endTime[1])!
    
    return (endHour - startHour) * 60 + endMin - startMin
}

func isMatch(m: String, code: String, duration: Int) -> Bool {
    let repeatedCode: String
    
    if duration < m.count {
        return false
    } else if duration < code.count {
        repeatedCode = String(code[code.startIndex..<code.index(code.startIndex, offsetBy: String.IndexDistance(duration))])
    } else {
        repeatedCode = String(repeating: code, count: (duration / code.count)) + String(code[code.startIndex..<code.index(code.startIndex, offsetBy: String.IndexDistance(duration % code.count))])
    }
    
    return repeatedCode.contains(m)
}

//print(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
//print(solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]))
//print(solution("ABC", ["12:00,12:03,HELLO,ABC", "13:00,13:05,WORLD,ABCDEF"]))
//print(solution("ABC#", ["12:00,12:14,HELLO,AEFGABC#Z", "13:00,13:05,WORLD,ABCDEF"]))
print(solution("ABC", ["12:00,12:03,HELLO,ABC", "13:00,13:06,WORLD,ABC"]))

