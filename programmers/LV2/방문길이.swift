import Foundation

struct Path: Equatable {
    var prevPoint: Point
    var currPoint: Point
    
    static func == (lhs: Path, rhs: Path) -> Bool {
        return ((lhs.prevPoint == rhs.prevPoint) && (lhs.currPoint == rhs.currPoint)) ||
            ((lhs.prevPoint == rhs.currPoint) && (lhs.currPoint == rhs.prevPoint))
    }
}

struct Point: Equatable {
    var x: Int
    var y: Int
    
    static func == (lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
}

enum Cmd: String {
    case U = "U"
    case D = "D"
    case L = "L"
    case R = "R"
}

func solution(_ dirs:String) -> Int {
    var currPath = Path(prevPoint: Point(x: 0, y: 0), currPoint: Point(x: 0, y: 0))
    var pathStack = [Path]()
    var range = 0
    
    for dir in dirs {
        let cmd = Cmd(rawValue: String(dir))!
        if !canMove(currPoint: currPath.currPoint, command: cmd) { continue }
        
        currPath.prevPoint = currPath.currPoint
        switch cmd {
        case .U: currPath.currPoint.y += 1
        case .D: currPath.currPoint.y -= 1
        case .L: currPath.currPoint.x -= 1
        case .R: currPath.currPoint.x += 1
        }
        
        if !pathStack.contains(where: { $0 == currPath }) {
            pathStack.append(currPath)
            range += 1
        }
    }
    
    return range
}

func canMove(currPoint: Point, command cmd: Cmd) -> Bool {
    switch cmd {
    case .U: if currPoint.y == 5 { return false }
    case .D: if currPoint.y == -5 { return false }
    case .L: if currPoint.x == -5 { return false }
    case .R: if currPoint.x == 5 { return false }
    }
    return true
}