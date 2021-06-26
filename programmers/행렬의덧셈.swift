import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
     var resultArr = [[Int]]()
     for oIdx in 0..<arr1.count{
         var innerArr = [Int]()
         for iIdx in 0..<arr1[oIdx].count{
             innerArr.append(arr1[oIdx][iIdx] + arr2[oIdx][iIdx])
         }
         resultArr.append(innerArr)
     }
     return resultArr
 }