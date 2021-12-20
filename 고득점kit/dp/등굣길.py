import sys

def solution(m, n, puddles):
    array = [[0] * m for n in range(n)]
    array[0][0] = 1
    for puddle in puddles:
        array[puddle[0]-1][puddle[1]-1] = "*"
    
    for column in range(n):
        for row in range(m):
            if (column == 0 and row == 0) or (array[column][row] == "*"): continue
            if column == 0: 
                array[column][row] += array[column][row-1]
                continue
            if row == 0:
                array[column][row] += array[column-1][row]
                continue
            else:
                upValue = 0 if array[column-1][row] == "*" else array[column-1][row]
                leftValue = 0 if array[column][row-1] == "*" else array[column][row-1]
                array[column][row] = upValue + leftValue

    return array[n-1][m-1]

print(solution(4, 3, [[2,2]]))