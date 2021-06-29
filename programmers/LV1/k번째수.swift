import Foundation

let arr = [1,5,2,6,3,7,4]
let cmd = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
// result = [5, 6, 3]

func foo(arr: [Int], command: [[Int]]) -> [Int] {
    var resultArr = [Int]()
    for cmd in command {
        var tmpArr = Array(arr[cmd[0]-1...cmd[1]-1])
        tmpArr.sort()
        resultArr.append(tmpArr[cmd[2]-1])
    }
    return resultArr
}

print(foo(arr: arr, command: cmd))
