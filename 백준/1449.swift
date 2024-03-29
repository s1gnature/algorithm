/*
 [1449번] 수리공 항승
 
 # Question
 파이프에서 물이 새는 곳은 신기하게도 가장 왼쪽에서 정수만큼 떨어진 거리만 물이 샌다.
 항승이는 길이가 L인 테이프를 무한개 가지고 있다.
 항승이는 테이프를 이용해서 물을 막으려고 한다. 항승이는 항상 물을 막을 때, 적어도 그 위치의 좌우 0.5만큼 간격을 줘야 물이 다시는 안 샌다고 생각한다.
 물이 새는 곳의 위치와, 항승이가 가지고 있는 테이프의 길이 L이 주어졌을 때, 항승이가 필요한 테이프의 최소 개수를 구하는 프로그램을 작성하시오. 테이프를 자를 수 없고, 테이프를 겹쳐서 붙이는 것도 가능하다.

 # Input
 첫째 줄에 물이 새는 곳의 개수 N과 테이프의 길이 L이 주어진다. 둘째 줄에는 물이 새는 곳의 위치가 주어진다.
 N과 L은 1,000보다 작거나 같은 자연수이고, 물이 새는 곳의 위치는 1,000보다 작거나 같은 자연수이다.
 
 4 2
 1 2 100 101
 
 # Output
 첫째 줄에 항승이가 필요한 테이프의 개수를 출력한다.
 
 2
 
 # TroubleShooting
 그리디, 정렬인데 예제 입력에는 sort 된 배열 줬으면서 테스트 케이스에서는 그렇게 안 주나 보다;;;
 그래서 sort 한번 해줘야 한다.
 */


import Foundation

let n = readLine()!.components(separatedBy: " ").flatMap({Int($0)})
var leakSpot = readLine()!.components(separatedBy: " ").flatMap({Int($0)})
let leakNum = n[0]
let tapeLen = n[1] - 1
leakSpot.sort()

var tapeNum = 0
var idx = 1
var maxTapingRange = leakSpot[0] + tapeLen

while idx < leakNum {
    if leakSpot[idx] > maxTapingRange {
        tapeNum += 1
        maxTapingRange = leakSpot[idx] + tapeLen
    }
    idx += 1
}
if leakSpot.last! <= maxTapingRange { tapeNum += 1 }
print(tapeNum)

