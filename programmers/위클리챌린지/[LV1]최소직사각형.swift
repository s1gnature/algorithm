import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var maxX = 0
    var maxY = 0

    sizes.forEach { 
        let largerLen = max($0[0], $0[1])
        let smallerLen = min($0[0], $0[1])
        if maxX < largerLen { maxX = largerLen }
        if maxY < smallerLen { maxY = smallerLen }
    }

    return maxX * maxY
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))