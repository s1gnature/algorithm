//let tc = readLine()!.split(separator: " ").map{ Int($0)! }
//let n = tc[0]
//let r = tc[1]
//let nr = n - r
//
//var countOfN = 0
//var countOfR = 0
//var divider = 5
//while n >= divider {
//    countOfN += (n / divider)
//    divider *= 5
//}
//divider = 5
//while r >= divider {
//    countOfR += (r / divider)
//    divider *= 5
//}
//
//if (countOfN - countOfR*2) < 0 { print(0) }
//else { print(countOfN - countOfR*2) }