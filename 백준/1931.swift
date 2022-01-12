let n = Int(readLine()!)!
var input = [[Int]]()
for _ in 0..<n {
    input.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
input.sort(by: {
    if $0[1] == $1[1] { return ($0[0] < $1[0]) }
    else { return ($0[1] < $1[1]) }
})

var currentHour = 0
var result = 0

input.forEach {
    if $0[0] >= currentHour {
        currentHour = $0[1]
        result += 1
    } else { return }
}

print(result)