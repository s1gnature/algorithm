n = int(input())
arr = list(map(int, input().split()))

decrease_arr = [1 for _ in range(len(arr))]

for idx in range(0, len(arr)-1):
    for inner_idx in range(idx+1, len(arr)):
        if arr[idx] < arr[inner_idx]: decrease_arr[idx] += 1
print(decrease_arr)