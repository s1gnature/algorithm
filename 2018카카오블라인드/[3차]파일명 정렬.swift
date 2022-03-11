func solution(_ files:[String]) -> [String] {
    var res = [(String, [String])]()
    files.forEach { res.append(trimmer($0)) }
    res.sort(by: {
        if $0.1[0].uppercased() == $1.1[0].uppercased() { return Int($0.1[1])! < Int($1.1[1])! }
        else { return $0.1[0].uppercased() < $1.1[0].uppercased() }
    })
    return res.compactMap({ return $0.0 })
}

func trimmer(_ filename: String) -> (String, [String]) {
    var tmp = String(filename.reversed())
    var head = ""
    var number = ""
    var tail = ""
    while let chr = tmp.last {
        if !chr.isNumber { head += String(tmp.popLast()!) }
        else { break }
    }
    while let chr = tmp.last {
        if chr.isNumber { number += String(tmp.popLast()!) }
        else { break }
    }
    tail = String(tmp.reversed())
    
    return (filename, [head, number, tail])
}
print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]))