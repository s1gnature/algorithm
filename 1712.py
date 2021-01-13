
a, b, v = map(int, input().split()) # 공백 기준 잘라서 대입
result = 1
result += int((v-a)/(a-b))
if (v-a)%(a-b) != 0: result += 1
print(result)
# print(int((v-a)/(a-b) + 1))