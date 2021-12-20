import Foundation

func solution(_ numbers:[Int]) -> Int {
    return numbers.reduce(45){$0-$1}
}