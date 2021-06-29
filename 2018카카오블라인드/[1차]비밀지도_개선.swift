import Foundation

let tc1_result = ["#####","# # #", "### #", "#  ##", "#####"]
let tc1_n = 5
let tc1_arr1 = [9, 20, 28, 18, 11]
let tc1_arr2 = [30, 1, 21, 17, 28]

let tc2_result = ["######", "###  #", "##  ##", " #### ", " #####", "### # "]
let tc2_n = 6
let tc2_arr1 = 	[46, 33, 33 ,22, 31, 50]
let tc2_arr2 = [27 ,56, 19, 14, 14, 10]

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map {
        let binaryString = String(format: "%0\(n)ld", Int64(String(arr1[$0] | arr2[$0], radix: 2))!)
        print(binaryString)
        return binaryString.reduce("") { $0 + ($1 == "1" ? "#": " ")}
    }
    
}

print(solution(tc1_n, tc1_arr1, tc1_arr2) == tc1_result)
print(solution(tc1_n, tc1_arr1, tc1_arr2))
print(solution(tc2_n, tc2_arr1, tc2_arr2) == tc2_result)
print(solution(tc2_n, tc2_arr1, tc2_arr2))