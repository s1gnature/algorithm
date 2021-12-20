import sys

def solution(prices):
    result = []
    priceLen = len(prices)
    for pivot in range(0, priceLen-1):
        timeCnt = 0
        for target in range(pivot+1, priceLen):
            timeCnt += 1
            if prices[pivot] > prices[target]: break

        result.append(timeCnt)
    return result + [0]

print(solution([1, 2, 3, 2, 3]))