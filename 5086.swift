/*
 [5086번] 배수와 약수
 
 # Question
 4 × 3 = 12이다.
 이 식을 통해 다음과 같은 사실을 알 수 있다.
 3은 12의 약수이고, 12는 3의 배수이다.
 4도 12의 약수이고, 12는 4의 배수이다.
 두 수가 주어졌을 때, 다음 3가지 중 어떤 관계인지 구하는 프로그램을 작성하시오.

 1. 첫 번째 숫자가 두 번째 숫자의 약수이다.
 2. 첫 번째 숫자가 두 번째 숫자의 배수이다.
 3. 첫 번째 숫자가 두 번째 숫자의 약수와 배수 모두 아니다.
 
 # Output
 각 테스트 케이스마다
 첫 번째 숫자가 두 번째 숫자의 약수라면 factor를,
 배수라면 multiple을,
 둘 다 아니라면 neither를 출력한다.
 */

import Foundation

while true {
    let input = readLine()!.components(separatedBy: " ").flatMap({Int($0)})
    if input[0] == input[1] && input[0] == 0 {break}
    
    if input[1] % input[0] == 0 { print("factor") }
    else if input[0] % input[1] == 0 { print("multiple") }
    else { print("neither") }
}
