import sys

def read(): return sys.stdin.readline()
n = read()
arr = list(map(int, read().split()))
arr.sort()
minChainCnt = 0
arrCnt = len(arr)
for minLenChain in arr:
    if (arrCnt - minLenChain) < 2:
        minChainCnt += (arrCnt - 1)
        break
    arrCnt -= (minLenChain + 1)
    minChainCnt += minLenChain
print(minChainCnt)