n = int(input())
a = list(map(int, input().split()))

bitonic_arr = [1 for _ in range(len(a))]
for pivot_idx in range(1, len(a)-1):
    left_arr = a[:pivot_idx]
    right_arr = a[pivot_idx+1:]
    print(left_arr)
    print(right_arr)
    print()
