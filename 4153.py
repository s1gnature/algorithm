
x, y, z = map(int, input().split()) # 공백 기준 잘라서 대입
while x != 0 and y != 0 and z != 0:
    if x**2 + y**2 == z**2 or x**2 + z**2 == y**2 or z**2 + y**2 == x**2: print('right')
    else: print('wrong')
    x, y, z = map(int, input().split()) # 공백 기준 잘라서 대입

