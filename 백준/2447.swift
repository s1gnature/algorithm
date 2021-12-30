import Foundation

func getStar(column: Int, row: Int, n: Int) -> String {
    if column % 3 == 1 && row % 3 == 1 {
        return " "
    }else if n == 1 {
        return "*"
    }else {
        return getStar(column: column / 3, row: row / 3, n: n / 3)
    }
}

func solution(n: Int) {
    for column in 0..<n {
        for row in 0..<n {
            print(getStar(column: column, row: row, n: n), terminator: "")
        }
        print()
    }
}

print(solution(n: 27))