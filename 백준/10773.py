n = int(input())
queue = []
for _ in range(n):
    k = int(input())
    if k == 0: queue.pop()
    else: queue.append(k)
print(sum(queue))