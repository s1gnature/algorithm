n = int(input())
arr = [i+1 for i in range(n)]
while len(arr) != 1:
    if len(arr) % 2: arr = [arr[-1]] + arr[1::2]
    else: arr = arr[1::2]
    print(arr)
print(arr[0])
'''
1 2 3 4 5 6
3 4 5 6 2
5 6 2 4
2 4 6
6 4
4

1 2 3 4

1 2 3 4 5
3 4 5 2
5 4 2
2 4
2
'''