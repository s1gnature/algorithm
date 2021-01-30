mem_arr = [0 for _ in range(101)]
'''
mem_arr[1] = mem_arr[2] = mem_arr[3] = 1
mem_arr[4] = mem_arr[5] = 2
mem_arr[6] = 3 
'''
def p(n):
    if n <= 3: return 1
    if n <= 5: return 2
    if n == 6: return 3

    if mem_arr[n-1] != 0 and mem_arr[n-5] != 0:
        mem_arr[n] = mem_arr[n-1] + mem_arr[n-5]
    elif mem_arr[n-1] == 0:
        mem_arr[n] = p(n-1) + mem_arr[n-5]
    elif mem_arr[n-5] == 0:
        mem_arr[n] = mem_arr[n-1] + p(n-5)
    else:
        mem_arr[n] = p(n-1) + p(n-5) 
    return mem_arr[n]
t = int(input())
for _ in range(t):
    n = int(input())
    print(p(n))