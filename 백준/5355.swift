// [5355번] 화성수학
import Foundation

(0..<Int(readLine()!)!).forEach { _ in
    var exp = readLine()!.split(separator: " ")
    var n = Double(exp.removeFirst())!
    exp.forEach {
        if $0 == "@" {
            n *= 3
        } else if $0 == "%" {
            n += 5
        } else if $0 == "#" {
            n -= 7
        }
    }
    print(String(format: "%.2f", n))
}