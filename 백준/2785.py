import sys
readl = sys.stdin.readline

n = int(readl())
arr = list(map(int, readl().split()))
arr.sort()
minChainCnt = 0
arrCnt = n
for minLenChain in arr:
    if (arrCnt - minLenChain) < 2:
        minChainCnt += (arrCnt - 1)
        break
    arrCnt -= (minLenChain + 1)
    minChainCnt += minLenChain
print(minChainCnt)