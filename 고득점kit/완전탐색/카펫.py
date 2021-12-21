import sys
import math

def solution(brown, yellow):
    for factor in range(1, int(math.sqrt(yellow)) + 1):
        if yellow % factor == 0:
            x = factor + 2
            y = int(yellow / factor) + 2
            if ((x * 2) + (y * 2) - 4) == brown: return [max(x, y), min(x, y)]

print(solution(10, 2))