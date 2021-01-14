import math

def calc(num):
    if math.sqrt(num)%1 < 0.5 and math.sqrt(num)%1 != 0: 
        print(int(math.sqrt(num))*2)
    else: print(round(math.sqrt(num))*2 - 1)

testCase = int(input())

for case in range(testCase):
    x, y = map(int, input().split()) # 공백 기준 잘라서 대입
    distance = y - x

    calc(distance)
    

'''
1*1 1*2 2*2 2*3 3*3 3*4...
1 : 1 / 1개
1 1 : 2 / 2개
1 1 1 : 3 
1 2 1 : 4 / 3개
1 2 1 1 : 5
1 2 2 1 : 6 / 4개
1 2 2 1 1 : 7
1 2 2 2 1 : 8
1 2 3 2 1 : 9 / 5개
1 2 3 2 1 1 : 10
1 2 3 2 2 1 : 11
1 2 3 3 2 1 : 12 / 6개
1 2 3 3 2 1 1 : 13
1 2 3 3 2 2 1 : 14
1 2 3 3 3 2 1 : 15
1 2 3 4 3 2 1 : 16 / 7개
1 2 3 4 3 2 1 1 : 17
1 2 3 4 3 2 2 1 : 18
1 2 3 4 3 3 2 1 : 19
1 2 3 4 4 3 2 1 : 20 / 8개
1 2 3 4 4 3 2 1 1 : 21
1 2 3 4 4 3 2 2 1 : 22
1 2 3 4 4 3 3 2 1 : 23
1 2 3 4 4 4 3 2 1 : 24
1 2 3 4 5 4 3 2 1 : 25 / 9개
1 2 3 4 5 4 3 2 1 1 : 26
'''


