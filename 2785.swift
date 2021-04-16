/*
 [2785번] 체인
 
 # Question
 희원이는 그의 다락방에서 N개의 체인을 찾았다. 각각의 체인은 몇 개의 고리로 연결되어 있는데, 각각의 고리는 최대 두 개의 인접한 고리를 가질 수 있다.
 각각의 고리는 열고 닫을 수 있다. 그래서, 체인을 분리하거나 두 체인을 연결하여 하나의 긴 체인으로 만들 수 있다.
 희원이는 가능한 한 적은 고리를 열고 닫아서, 모든 체인을 하나의 긴 체인으로 연결하려고 한다.

 예를 들어, 희원이가 세 개의 체인을 가지고 있고, 각 체인이 고리 하나로만 이루어져 있다면, 그 중 하나를 열어서 나머지 두 개를 연결하고 닫으면 된다.

 # Input

 
 # Output
 첫째 줄에 필요한 고리의 최소 개수를 출력한다.
 
 # TroubleShooting

 */


import Foundation

let n = Int(String(readLine()!))
var arr = readLine()!.split(separator: " ").map({Int(String($0))!})
arr.sort()
var minChainCnt = 0
var arrCnt = arr.count

for minLenChain in arr {
    if (arrCnt - minLenChain) < 2 {
        minChainCnt += (arrCnt - 1)
        break
    }
    arrCnt -= (minLenChain + 1)
    minChainCnt += minLenChain
}

print(minChainCnt)