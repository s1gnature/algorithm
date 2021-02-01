n = int(input())
result = set()
for _ in range(n):
    result.add(str(input()))
result = list(result)
result.sort(key=lambda word: word)
result.sort(key=lambda word: len(word))

for word in result:
    print(word)