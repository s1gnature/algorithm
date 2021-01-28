n = int(input())
result = []
for _ in range(n):
    age, name = input().split()
    result.append([age, name])
result.sort(key=lambda age: int(age[0]))
for value in result:
    print('%s %s' %(value[0], value[1]))