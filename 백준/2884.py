# 알람시계

h, m = map(int, input().split()) # 공백 기준 잘라서 대입
if m < 45:
    if h-1 < 0: h = 24
    print('%d %d' %(h-1, 60+(m-45)))
else: print('%d %d' %(h, m-45))