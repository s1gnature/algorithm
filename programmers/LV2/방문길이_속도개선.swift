import Foundation

enum Cmd: String {
    case U = "U"
    case D = "D"
    case L = "L"
    case R = "R"
}

func solution(_ dirs:String) -> Int {
    var range = 0
    var pathStack = Set<String>()
    var currPoint = (0, 0)
    
    dirs.forEach {
        let cmd = Cmd(rawValue: String($0))!
        if !canMove(currPoint: currPoint, command: cmd) { return }
        
        switch cmd {
        case .U:
            currPoint.1 += 1
            pathStack.insert("\(currPoint.0)\(Double(currPoint.1)-0.5)")
        case .D:
            currPoint.1 -= 1
            pathStack.insert("\(currPoint.0)\(Double(currPoint.1)+0.5)")
        case .L:
            currPoint.0 -= 1
            pathStack.insert("\(Double(currPoint.0)+0.5)\(currPoint.1)")
        case .R:
            currPoint.0 += 1
            pathStack.insert("\(Double(currPoint.0)-0.5)\(currPoint.1)")
        }
    }

    return pathStack.count
}

func canMove(currPoint: (Int, Int), command cmd: Cmd) -> Bool {
    switch cmd {
    case .U: if currPoint.1 == 5 { return false }
    case .D: if currPoint.1 == -5 { return false }
    case .L: if currPoint.0 == -5 { return false }
    case .R: if currPoint.0 == 5 { return false }
    }
    return true
}