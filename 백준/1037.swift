/*
# Question
양수 A가 N의 진짜 약수가 되려면, N이 A의 배수이고, A가 1과 N이 아니어야 한다. 
어떤 수 N의 진짜 약수가 모두 주어질 때, N을 구하는 프로그램을 작성하시오.

# Input
첫째 줄에 N의 진짜 약수의 개수가 주어진다. 이 개수는 50보다 작거나 같은 자연수이다. 둘째 줄에는 N의 진짜 약수가 주어진다. 
1,000,000보다 작거나 같고, 2보다 크거나 같은 자연수이고, 중복되지 않는다.
-------------
2
4 2
-------------

# Output
첫째 줄에 N을 출력한다. N은 항상 32비트 부호있는 정수로 표현할 수 있다.
-------------
8
-------------
*/
import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.components(separatedBy: " ").flatMap({Int($0)})
arr.sort()
if n % 2 == 0 { print(arr.first! * arr.last!)}
if n % 2 != 0 { print(arr[n/2] * arr[n/2]) }

