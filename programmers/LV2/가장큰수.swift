import Foundation

/*
 7/1
 DFS로 풀면 시간 초과가 된다. recursion을 축소 시켜도 조합을 찾기 때문에 시간이 오래 걸린다.
 다른 방법이 없을까?

7/2 또 실패. 더 좋은 예제 찾음
 numbers의 원소들을 4자리로 연장.
 두 숫자가 같은 경우 {ex) [1, 11] -> [1111, 1111]} 는 원래 숫자의 자릿수가 적은 쪽이 우선 순위.
 sort한 순서대로 result에 추가. 
 func solution(_ numbers:[Int]) -> String {
    var result = ""
    var numbers = numbers.map { String($0) }
    var numbersKey = Dictionary<String, String>()

    numbers.forEach {
        var tmp = $0
        while tmp.count < 4 { tmp += tmp }
        if tmp.count > 4 { numbersKey[$0] = String(tmp.prefix(4)) }
        else { numbersKey[$0] = tmp }
    }
    let numbersKeySorted = numbersKey.sorted {
        if $0.1 == $1.1 { return $0.key.count < $1.key.count }
        else { return $0.1 > $1.1 }
    }
    numbersKeySorted.forEach {
        result.append(String($0.key))
    }

    return String(Int(result)!)

Solution
그냥 sort 할때부터 문자열에 숫자를 앞 뒤로 붙여보고 오름차순으로 sort 해서 array를 만들고
각 원소 합쳐서 리턴. 다만 [0,0,0] 같은 경우는 000 으로 나오니까 Int로 한번 걸러서 리턴
*/
func solution(_ numbers:[Int]) -> String {
    var numbers = numbers.sorted{ Int(String($0) + String($1))! > Int(String($1) + String($0))! }
    if numbers[0] == 0 { return "0" }
    return numbers.reduce(""){ $0 + String($1) }
}

print(solution([0, 0]))

