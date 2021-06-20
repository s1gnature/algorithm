import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    // *,0,# 은 각각 10,11,12로 간주함
    var currLHandSpot = 10
    var currRHandSpot = 12
    for value in numbers {
        var num: Int {
            if value == 0 { return 11 }
            else { return value }
        }
        // [1,4,7], [3,6,9] 는 항상 왼손, 오른손 
        if num % 3 == 1 {
            currLHandSpot = num
            result += "L"
            continue
        }else if num % 3 == 0 && num != 0 {
            currRHandSpot = num
            result += "R"
            continue
        }
        /*
            absValue는 현재 손가락의 위치가 2,5,8,0(11) 에 위치할 때 abs % 3 은 항상 0의 값을 가짐
            그리고 그 값은 거리가 됨.
            그리고 각각의 거리 값 공식이 abs(누를 버튼 - 손가락의 위치)+1)/3)+1 인 이유는
            왼손은 [1,3,7] 일 때, (누를 버튼 - 손가락의 위치) 값이 양수이면 3으로 나눈 나머지가 항상 1, 음수이면 나머지가 2
            왼손은 [3,6,9] 일 때, (누를 버튼 - 손가락의 위치) 값이 양수이면 3으로 나눈 나머지가 항상 2, 음수이면 나머지가 1 인데,
            나머지가 1인 case에 대해서는 거리 값이 +1 을 해주면 바로 나오나 나머지가 2인 case는 먼저 1을 더해 3으로 나눈 몫에
            1을 더해주고 마지막으로 1을 더해야 정상적인 거릿값이 나옴.
            나머지 1인 case: abs(누를 버튼 - 손가락의 위치)/3 + 1
            나머지 2인 case: abs(누를 버튼 - 손가락의 위치)/3 + 2
            이러한 식이 나오는데 공식의 통일성을 위해 (abs(누를 버튼 - 손가락의 위치) + 1)/3 + 1 과 같이 표현 함.
        */
        var LDist: Int {
            let absValue = abs(num - currLHandSpot)
            if absValue % 3 == 0 {
                return absValue / 3
            }else {
                return (((abs(num - currLHandSpot)+1)/3)+1)
            }
        }
        var RDist: Int {
            let absValue = abs(num - currRHandSpot)
            if absValue % 3 == 0 {
                return absValue / 3
            }else {
                return (((abs(num - currRHandSpot)+1)/3)+1)
            }
        }
        if LDist < RDist {
            currLHandSpot = num
            result += "L"
        }
        else if LDist > RDist {
            currRHandSpot = num
            result += "R"
        }
        else {
            if hand == "left" {
                currLHandSpot = num
                result += "L"
            }else {
                currRHandSpot = num
                result += "R"
            }
        }
    }
    return result
}