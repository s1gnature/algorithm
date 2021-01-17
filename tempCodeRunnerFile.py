queue = [0, 1]
n = int(input()) # 공백 기준 잘라서 대입
if n <= 2: print(queue[n])
for _ in range(n-1):
    print(queue)
    print(queue)
print(queue.pop())