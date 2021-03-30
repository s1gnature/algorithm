/*
 [9375번] 패션왕 신해빈
 
 # Question
 해빈이는 패션에 매우 민감해서 한번 입었던 옷들의 조합을 절대 다시 입지 않는다. 예를 들어 오늘 해빈이가 안경, 코트,
 상의, 신발을 입었다면, 다음날은 바지를 추가로 입거나 안경대신 렌즈를 착용하거나 해야한다. 해빈이가 가진 의상들이
 주어졌을때 과연 해빈이는 알몸이 아닌 상태로 며칠동안 밖에 돌아다닐 수 있을까?

 # Input
 첫째 줄에 테스트 케이스가 주어진다. 테스트 케이스는 최대 100이다.
 각 테스트 케이스의 첫째 줄에는 해빈이가 가진 의상의 수 n(0 ≤ n ≤ 30)이 주어진다.
 다음 n개에는 해빈이가 가진 의상의 이름과 의상의 종류가 공백으로 구분되어 주어진다. 같은 종류의 의상은 하나만 입을 수 있다.
 모든 문자열은 1이상 20이하의 알파벳 소문자로 이루어져있으며 같은 이름을 가진 의상은 존재하지 않는다.
 
 # Output
 각 테스트 케이스에 대해 해빈이가 알몸이 아닌 상태로 의상을 입을 수 있는 경우를 출력하시오.
 
 # TroubleShooting
 처음엔 각각의 케이스에 대해 하나씩 곱하는 방식으로 했다. 이 때, 간과한 것이 의상 카테고리에서 아무것도 입지 않았을 경우를
 처리하는게 핵심이었는데 이부분을 for 문 안에서 해결하려 하니 로직도 복잡해지고 결과가 이상하게 나왔는데,
 애초에 처음부터 아무것도 입지 않은 경우, 즉 입을 수 있는 옷 가짓 수 + 1(해당 의상 카테고리에서 입지 않는 경우) 을 해주고, 모두 곱한 다음에 마지막 결과에서 -1을 해주면 모든 의상 카테고리에서 아무것도 입지 않은 경우를 제외할 수 있다
 */


import Foundation

let testCase = Int(readLine()!)!
for _ in 0..<testCase {
    var result = 1
    let n = Int(readLine()!)!
    var clothDict = Dictionary<String, [String]>()
    for _ in 0..<n {
        let clothValue = readLine()!.components(separatedBy: " ")
        var currValue = clothDict[clothValue[1]] ?? [String]()
        currValue.append(clothValue[0])
        clothDict.updateValue(currValue, forKey: clothValue[1])
    }
    for valueArr in clothDict.values {
        result *= valueArr.count + 1
    }
    print(result - 1)
}