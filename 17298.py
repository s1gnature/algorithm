import sys
from collections import deque
def read(): return sys.stdin.readline()

def NGE(idx, arr):
    pivot_arr = arr[idx+1:]
    for value in pivot_arr:
        if arr[idx] < value: return value
    return -1
n = int(read())
arr = list(map(int, read().split()))

for idx in range(n-1):
    print('%d' %(NGE(idx, arr)), end=' ')
print('-1')