import math

testCase = int(input())
for _ in range(testCase):
    x1, y1, r1, x2, y2, r2 = map(int, input().split()) # 공백 기준 잘라서 대입
    distance = math.sqrt(abs(x2-x1)**2 + abs(y2-y1)**2)
    if x1 == x2 and y1 == y2 and r1 == r2: print('-1')
    elif distance < (r1 + r2) and distance > abs(r2 - r1): print('2')
    elif distance == (r1 + r2): print('1') # 외접
    elif distance == abs(r2 - r1): print('1') # 내접
    else: print('0')
    # elif distance < abs(r2 - r1): print('0') # 내부에서 만나지 않음
    # elif distance > (r1 + r2): print('0') # 외부에서 만나지 않음
    # else: print('-1')