import sys

def solution(triangle):
    sumOfTriangle = triangle
    for line in range(1, len(sumOfTriangle)):
        sumOfTriangle[line][0] += sumOfTriangle[line-1][0]
        sumOfTriangle[line][-1] += sumOfTriangle[line-1][-1]
        for index in range(1, len(sumOfTriangle[line])-1):
            sumOfTriangle[line][index] += max(sumOfTriangle[line-1][index-1], sumOfTriangle[line-1][index])
    return max(sumOfTriangle[-1])


tc1 = [[7], [3, 8], [8, 1, 0], [2, 7, 4, 4], [4, 5, 2, 6, 5]]
tc1_result = 30
print(solution(tc1))