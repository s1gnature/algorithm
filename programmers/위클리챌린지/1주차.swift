import Foundation

print(solution(3, 20, 4))

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let totalPrice = Int64((1...count).reduce(0, {$0 + price * $1}))
    if money < totalPrice { return totalPrice - Int64(money) }
    else { return 0 } 
}