import Foundation

enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
}
func isValidDirection(direction: Direction, places: [String], x oldX: Int, y oldY: Int, isDoubleCheck: Bool = false) -> Bool {
    let x: Int
    let y: Int
    switch direction {
    case .up:
        x = oldX
        y = (oldY - 1 < 0 ? 0 : oldY - 1)
    case .down:
        x = oldX
        y = (oldY + 1 > 4 ? 4 : oldY + 1)
    case .left:
        x = (oldX - 1 < 0 ? 0 : oldX - 1)
        y = oldY
    case .right:
        x = (oldX + 1 > 4 ? 4 : oldX + 1)
        y = oldY
    }
    let xIndex = places[y].index(places[y].startIndex, offsetBy: x)
    
    if (oldX == x) && (oldY == y) { return true }
    else if isDoubleCheck && (places[y][xIndex] != "P") { return true }
    else if places[y][xIndex] == "X" { return true }
    else if places[y][xIndex] == "P" { return false }
    
    switch direction {
    case .up:
        return isValidDirection(direction: .up, places: places, x: x, y: y, isDoubleCheck: true) &&
            isValidDirection(direction: .left, places: places, x: x, y: y, isDoubleCheck: true) &&
            isValidDirection(direction: .right, places: places, x: x, y: y, isDoubleCheck: true)
    case .down:
        return isValidDirection(direction: .down, places: places, x: x, y: y, isDoubleCheck: true) &&
            isValidDirection(direction: .left, places: places, x: x, y: y, isDoubleCheck: true) &&
            isValidDirection(direction: .right, places: places, x: x, y: y, isDoubleCheck: true)
    case .left:
        return isValidDirection(direction: .left, places: places, x: x, y: y, isDoubleCheck: true) &&
            isValidDirection(direction: .up, places: places, x: x, y: y, isDoubleCheck: true) &&
            isValidDirection(direction: .down, places: places, x: x, y: y, isDoubleCheck: true)
    case .right:
        return isValidDirection(direction: .right, places: places, x: x, y: y, isDoubleCheck: true) &&
            isValidDirection(direction: .up, places: places, x: x, y: y, isDoubleCheck: true) &&
            isValidDirection(direction: .down, places: places, x: x, y: y, isDoubleCheck: true)
    }
}

func solution(_ places:[[String]]) -> [Int] {
    var res = [Int]()
    places.forEach { input in
        var flag = true
        for y in 0..<5 {
            for x in 0..<5 {
                let xIndex = input[y].index(input[y].startIndex, offsetBy: x)
                if input[y][xIndex] == "X" || input[y][xIndex] == "O" { continue }
                Direction.allCases.forEach { flag = flag && isValidDirection(direction: $0, places: input, x: x, y: y) }
                if !flag { break }
            }
            if !flag { break }
        }
        flag ? res.append(1) : res.append(0)
    }
    
    return res
}